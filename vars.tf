variable "gitUsername" {
  type = "string"
  default = ""
}

variable "preferFork" {
  type = "string"
  default = "0"
}

variable "installPath" {
  type = "string"
  default = "src"
}

//Base Repo
variable "ckanRepo" {
  type = "string"
  default = "ckan/ckan"
}

variable "ckanBranch" {
  type = "string"
  default = "master"
}


//Custom Repos
variable "ckanExtBcGov"{
  type = "string"
  default = "bcgov/ckanext-bcgov"
}

variable "ckanExtBcGovBranch"{
  type = "string"
  default = "master"
}

variable "ckanExtBcGovCli"{
  type = "string"
  default = "bcgov/ckanext-bcgov-cli"
}

variable "ckanExtBcGovCliBranch"{
  type = "string"
  default = "master"
}

variable "ckanExtOpenApiViewer"{
  type = "string"
  default = "bcgov/ckanext-openapiviewer"
}

variable "ckanExtOpenApiViewerBranch"{
  type = "string"
  default = "master"
}

variable "ckanExtRssSource" {
  type = "string"
  default = "https://gogs.data.gov.bc.ca"
}

variable "ckanExtRss"{
  type = "string"
  default = "bcdc/ckanext-edc-rss"
}

variable "ckanExtRssBranch"{
  type = "string"
  default = "master"
}


//Forks that differ from base very slightly
variable "ckanExtDisqus" {
  type = "string"
  default = "bcgov/ckanext-bcgov-disqus"
}

variable "ckanExtDisqusBranch" {
  type = "string"
  default = "master"
}

variable "ckanExtGaReport"{
  type = "string"
  default = "bcgov/ckanext-ga-report"
}

variable "ckanExtGaReportBranch"{
  type = "string"
  default = "master"
}

variable "ckanExtGeoview"{
  type = "string"
  default = "bcgov/ckanext-geoview"
}

variable "ckanExtGeoviewBranch"{
  type = "string"
  default = "master"
}

variable "ckanExtGoogleAnalytics"{
  type = "string"
  default = "bcgov/ckanext-googleanalytics"
}

variable "ckanExtGoogleAnalyticsBranch"{
  type = "string"
  default = "master"
}

variable "ckanExtHierarchy"{
  type = "string"
  default = "bcgov/ckanext-hierarchy"
}

variable "ckanExtHierarchyBranch"{
  type = "string"
  default = "master"
}

//CKAN Extensions
variable "ckanExtDatapusher"{
  type = "string"
  default = "ckan/datapusher"
}

variable "ckanExtDatapusherBranch"{
  type = "string"
  default = "master"
}

variable "ckanExtSSO"{
  type = "string"
  default = "bcgov/ckanext-sso"
}

variable "ckanExtSSOBranch"{
  type = "string"
  default = "dev"
}

variable "ckanUI"{
  type = "string"
  default = "bcgov/ckan-ui"
}

variable "ckanUIBranch"{
  type = "string"
  default = "dev"
}

variable "solrRepo"{
  type = "string"
  default = "solr"
}

variable "solrTag"{
  type = "string"
  default = "6.2-alpine"
}

variable "postgresRepo"{
  type = "string"
  default = "postgres"
}

variable "postgresTag"{
  type = "string"
  default = "9.6-alpine"
}

variable "redisRepo"{
  type = "string"
  default = "redis"
}

variable "redisTag"{
  type = "string"
  default = "alpine"
}

variable "solrCore"{
  type = "string"
  default = "ckan"
}

variable "postgresDb"{
  type = "string"
  default = "ckan"
}

variable "postgresUser"{
  type = "string"
  default = "ckan"
}

variable "postgresPass"{
  type = "string"
  default = "ckan"
}

variable "solrPort"{
  type = "string"
  default = "8983"
}

variable "postgresPort"{
  type = "string"
  default = "5432"
}

variable "redisPort"{
  type = "string"
  default = "6379"
}

variable "ckanPlugins"{
  type = "string"
  default = <<EOF
resource_proxy text_view recline_view recline_map_view recline_grid_view geo_view
datastore datapusher recline_graph_view openapi_view pdf_view geojson_view
edc_dataset edc_rss edc_app edc_geo edc_ngeo edc_webservice
hierarchy_display hierarchy_form googleanalytics ga-report sso
EOF
}

variable "ssoAuthEndpoint"{
  type = "string"
  default = ""
}

variable "ssoRealm"{
  type = "string"
  default = "ckan"
}

variable "ssoClientId"{
  type = "string"
  default = "ckan"
}

variable "ssoClientSecret"{
  type = "string"
  default = ""
}

variable "ssoSysadminGroup"{
  type = "string"
  default = "sysadmin"
}
	
variable "ssoGroupField"{
  type = "string"
  default = "groups"
}	
	
variable "ssoUsernameField"{
  type = "string"
  default = "preferred_username"
}

variable "ssoEmailField"{
  type = "string"
  default = "email"
}

variable "ssoNameField"{
  type = "string"
  default = "name"
}

variable "ckanVersion"{
  type = "string"
  default = "ckan-2.7.2"
}

variable "gaID"{
  type = "string"
  default = "id"
}

variable "gaAccount"{
  type = "string"
  default = "account"
}

variable "gaUser"{
  type = "string"
  default = "user"
}