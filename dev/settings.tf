resource "random_string" "sessionSecret"{
  length = 25
  special = false
  override_special = "/@\" "
}

resource "random_string" "apiKey"{
  length = 36
  special = false
  override_special = "/@\" "
}

resource "random_string" "geoApiKey"{
  length = 36
  special = false
  override_special = "/@\" "
}


resource "local_file" "log_file" {
  filename = "${local.logFolder}/dlv.log"

  content = ""
}

resource "local_file" "who_ini" {
  filename = "${local.confFolder}/who.ini"

  content = <<EOF
[plugin:auth_tkt]
use = ckan.lib.auth_tkt:make_plugin
# If no secret key is defined here, beaker.session.secret will be used
#secret = somesecret

[plugin:friendlyform]
use = repoze.who.plugins.friendlyform:FriendlyFormPlugin
login_form_url= /user/login
login_handler_path = /login_generic
logout_handler_path = /user/logout
rememberer_name = auth_tkt
post_login_url = /user/logged_in
post_logout_url = /user/logged_out
charset = utf-8

#[plugin:basicauth]
#use = repoze.who.plugins.basicauth:make_plugin
#realm = 'CKAN'

[general]
request_classifier = repoze.who.classifiers:default_request_classifier
challenge_decider = repoze.who.classifiers:default_challenge_decider

[identifiers]
plugins =
    friendlyform;browser
    auth_tkt

[authenticators]
plugins =
    auth_tkt
    ckan.lib.authenticator:UsernamePasswordAuthenticator

[challengers]
plugins =
    friendlyform;browser
#   basicauth

EOF
}


resource "local_file" "ckan_ini" {
  filename = "${local.confFolder}/ckan.ini"
  //This stops it form generating the ini every run, but do we want that?
  lifecycle {
    ignore_changes = ["content"]
  }

  content = <<EOF

#
# CKAN - Pylons configuration
#
# These are some of the configuration options available for your CKAN
# instance. Check the documentation in 'doc/configuration.rst' or at the
# following URL for a description of what they do and the full list of
# available options:
#
# http://docs.ckan.org/en/ckan-2.2/configuration.html
#
# The %(here)s variable will be replaced with the parent directory of this file
#

[DEFAULT]

# WARNING: *THIS SETTING MUST BE SET TO FALSE ON A PRODUCTION ENVIRONMENT*
debug = true

[server:main]
use = egg:Paste#http
host = 0.0.0.0
port = 5000
use_threadpool = true
threadpool_workers = 8

[app:main]
use = egg:ckan
full_stack = true
cache_dir = redis://127.0.0.1:${local.redisPort}
ckan.cache_enabled = false
beaker.session.key = ckan
ckan.tracking_enabled = true

ckan.use_pylons_response_cleanup_middleware = true

# This is the secret token that the beaker library uses to hash the cookie sent
# to the client. `paster make-config` generates a unique value for this each
# time it generates a config file.
beaker.session.secret = ${random_string.sessionSecret.result}

# `paster make-config` generates a unique value for this each time it generates
# a config file.
app_instance_uuid = {${uuid()}}

# repoze.who config
who.config_file = %(here)s/who.ini
who.log_level = warning
who.log_file = %(cache_dir)s/who_log.ini


## Database Settings
sqlalchemy.url = postgresql://${local.postgresUser}:${local.postgresPass}@127.0.0.1:${local.postgresPort}/${local.postgresDb}

ckan.datastore.write_url = postgresql://${local.postgresUser}:${local.postgresPass}@127.0.0.1:${local.postgresPort}/datastore
ckan.datastore.read_url = postgresql://${local.postgresUser}:${local.postgresPass}@127.0.0.1:${local.postgresPort}/datastore



## Site Settings
ckan.site_url = http://127.0.0.1:5000

ckan.api_key = ${random_string.apiKey.result}

#ETS settings
edc.imap_url_pub=http://maps.gov.bc.ca/ess/hm/imap4m/?catalogLayers=
edc.imap_url_gov=https://arcmaps.gov.bc.ca/ess/hm/imap4m/?catalogLayers=

#page to return to after logout via siteminder
edc.siteminder_return_url=https://cad.data.gov.bc.ca/user/logged_out_redirect

## Authorization Settings

ckan.auth.anon_create_dataset = false
ckan.auth.create_unowned_dataset = false
ckan.auth.create_dataset_if_not_in_organization = false
ckan.auth.user_create_groups = false
ckan.auth.user_create_organizations = false
ckan.auth.user_delete_groups = false
ckan.auth.user_delete_organizations = false
ckan.auth.create_user_via_api = true
ckan.auth.create_user_via_web = false
ckan.auth.roles_that_cascade_to_sub_groups = admin

## Resource formats
ckan.resource_formats = ${path.root}/${local.installPath}/ckanext-bcgov/ckanext/bcgov/resource_formats.json

## Search Settings
ckan.datasets_per_page = 20
ckan.site_id = dlv
solr_url = http://127.0.0.1:${local.solrPort}/solr/${local.solrCore}
ckan.search.show_all_types = true
#set ckan search auto index to false when bulk load data
ckan.search.automatic_indexing = true
ckan.search.solr_commit = false
search.facets.limit = 500
search.facets.default = 20
ckan.extra_resource_fields = resource_storage_location

## Plugins Settings

# Note: Add ``datastore`` to enable the CKAN DataStore
#       Add ``datapusher`` to enable DataPusher
#		Add ``resource_proxy`` to enable resorce proxying and get around the
#		same origin policyhttp://127.0.0.1:5000/dataset
ckan.plugins = ${local.ckanPlugins}


scheming.dataset_schemas = ckanext.scheming:camel_photos.json
                           ckanext.repeating:repeating_scheming.json

scheming.presets = ckanext.scheming:presets.json
                   ckanext.repeating:presets.json
                   ckanext.composite:presets.json

#   The is_fallback setting may be changed as well. Defaults to false:
scheming.dataset_fallback = true

# resource views
ckan.views.default_views = text_view recline_view geojson_view openapi_view geo_view pdf_view

## GEOVIEW format
ckanext.geoview.ol_viewer.formats = wms gft
ckanext.geoview.gapi_key = ${random_string.geoApiKey.result}

# JSON View formats
ckan.preview.json_formats = json openapi-json openapi

#CKAN Spatial configuration
ckanext.spatial.search_backend = solr
ckanext.spatial.common_map.type = custom
ckanext.spatial.common_map.custom.url = https://services.arcgisonline.com/arcgis/rest/services/Canvas/World_Light_Gray_Base/MapServer/tile/{z}/{y}/{x}.png
ckanext.spatial.common_map.attribution = Map data &copy; Province of British Columbia, Tiles Courtesy of <a href="https://services.arcgisonline.com/arcgis/rest/services/Canvas/World_Light_Gray_Base/MapServer" target="_blank">ESRI Inc.</a>


#CKAN preview configuration
ckanext.reclineview.mapview.type = mapbox
ckanext.reclineview.mapview.mapbox.map_id = databc.ji2mgln8
ckanext.reclineview.mapview.mapbox.access_token = pk.eyJ1IjoiZGF0YWJjIiwiYSI6ImFPN3ZET0kifQ.7GWQYk_KrtbXSyYWOKGrIQ
ckanext.reclineview.mapview.attribution=© <a target=_blank href='https://www.mapbox.com/map-feedback/'>Mapbox</a> © <a target=_blank href='http://www.openstreetmap.org/copyright'>OpenStreetMap</a>

#CKAN-EAS configuration
edc.edc_fqdn = http://test.www.data.gov.bc.ca


## EDC Version no.
edc.major_version = DLV

##DISQUS extension configuration
disqus.name = local_vagrant
edcdisqus.api_key = GoqdSQi0TATdd9PjfFiR5BRgu11MgmVvsOpzv1kWfvKjFmvsJnEnbatur5PCPTXi
edcdisqus.forum_name = jsmith-vagrant
edcdisqus.access_token = f5b3bb3849e941b4a564e8cc4d70c98c
edcdisqus.widget_api_key = E8Uh5l5fHZ6gD8U3KycjAIAk46f68Zw7C6eW8WSjZvCLXebZ7p0r1yrYDrLilk2F


## Front-End Settings
ckan.site_title = Data Catalogue - Delivery
ckan.site_logo = /base/images/ckan-logo.png
ckan.site_description =
ckan.favicon = /base/images/favicon.ico
ckan.gravatar_default = identicon
ckan.preview.direct = png jpg gif
ckan.preview.loadable = html htm rdf+xml owl+xml xml n3 n-triples turtle plain atom csv tsv rss txt json

# package_hide_extras = for_search_index_only
licenses_group_url = file:///${path.root}/${local.installPath}/ckanext-bcgov/ckanext/bcgov/scripts/data/bcdc_licenses.json
sectors_file_url = file:///${path.root}/${local.installPath}/ckanext-bcgov/ckanext/bcgov/scripts/data/bcdc_sectors.json

## Internationalisation Settings
ckan.locale_default = en
ckan.locale_order = en pt_BR ja it cs_CZ ca es fr el sv sr sr@latin no sk fi ru de pl nl bg ko_KR hu sa sl lv
ckan.locales_offered =
ckan.locales_filtered_out = en_GB
ckan.display_timezone =

## Feeds Settings
ckan.feeds.authority_name =
ckan.feeds.date =
ckan.feeds.author_name =
ckan.feeds.author_link =

## Redis
ckan.redis.url = redis://127.0.0.1:${local.redisPort}/1

## Storage Settings
ckan.storage_path = ${path.root}/ckan_store

## Datapusher settings
# Make sure you have set up the DataStore
ckan.datapusher.url = http://127.0.0.1:8800/
ckan.datapusher.formats = csv xls xlsx tsv


## Email settings
stmp.test_server = localhost

##Google Analytics settings
googleanalytics.id = ${local.gaID}
googleanalytics.account = ${local.gaAccount}
googleanalytics.username = ${local.gaUser}
googleanalytics_resource_prefix = /downloads/
googleanalytics.domain = auto
googleanalytics.token.filepath = /apps/ckan/conf/bcgov-token.dat
googleanalytics.show_downloads = true
ga-report.period = monthly
ga-report.bounce_url = /

# OFI settings
#bcgov.ofi.enable = true
bcgov.ofi.api.protocol = https
bcgov.ofi.api.hostname = apps.gov.bc.ca
#bcgov.ofi.api.hostname = 10.0.2.15
#bcgov.ofi.api.port = 8091
bcgov.ofi.api.order_path = /pub/dwds-ofi
bcgov.ofi.api.order_secure_path = /pub/dwds-ofi/secure
bcgov.ofi.api.convert_to_single_res = true
## only use this flag for local dev env when there is no siteminer session
bcgov.ofi.api.dev_secure_call = true


# POW Settings
bcgov.pow.env =
bcgov.pow.secure_site = false
bcgov.pow.past_orders_nbr = 5
bcgov.pow.custom_aoi_url = http://maps.gov.bc.ca/ess/hm/aoi/
bcgov.pow.persist_config = true
bcgov.pow.use_pow_ui = true
bcgov.pow.enable_mow = false

## Logging configuration
[loggers]
keys = root, ckan, ckanext

[handlers]
keys = rotfile, console

[formatters]
keys = generic

[logger_root]
level = INFO
handlers = rotfile

[logger_auth]
level = WARN
handlers = rotfile
qualname = auth

[handler_console]
class = StreamHandler
args = (sys.stderr,)
level = NOTSET
formatter = generic

[handler_rotfile]
class = handlers.RotatingFileHandler
args = ('${local.logFolder}/dlv.log', 'w', 10485760, 5)
level = NOTSET
formatter = generic

[formatter_generic]
format = %(asctime)s,%(msecs)03d %(levelname)-5.5s [%(name)s] %(message)s
datefmt = %Y-%m-%d %H:%M:%S

[logger_root]
level = WARNING
handlers = rotfile

[logger_ckan]
level = INFO
handlers = rotfile, console
qualname = ckan
propagate = 0

[logger_ckanext]
level = DEBUG
handlers = rotfile, console
qualname = ckanext
propagate = 0


EOF

}

