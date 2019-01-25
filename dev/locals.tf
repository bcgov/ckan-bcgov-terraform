variable "gitUsername" {
  type = "string"
  default = ""
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

variable "preferFork"{
  type = "string"
  default = "1"
}


variable "solrRepo"{
  type = "string"
  default = "solr"
}

variable "solrTag"{
  type = "string"
  default = "latest"
}

variable "postgresRepo"{
  type = "string"
  default = "postgres"
}

variable "postgresTag"{
  type = "string"
  default = "latest"
}

variable "redisRepo"{
  type = "string"
  default = "redos"
}

variable "redisTag"{
  type = "string"
  default = "latest"
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
hierarchy_display hierarchy_form googleanalytics ga-report edc_disqus
EOF
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

locals{
  gitUsername = "${var.gitUsername}"
  preferFork = "${var.preferFork}"

  installPath = "${var.installPath}"

  ckanRepo = "${var.ckanRepo}"
  ckanBranch = "${var.ckanBranch}"

  ckanExtBcGov = "${var.ckanExtBcGov}"
  ckanExtBcGovBranch = "${var.ckanExtBcGovBranch}"
  ckanExtBcGovCli = "${var.ckanExtBcGovCli}"
  ckanExtBcGovCliBranch = "${var.ckanExtBcGovCliBranch}"
  ckanExtOpenApiViewer = "${var.ckanExtOpenApiViewer}"
  ckanExtOpenApiViewerBranch = "${var.ckanExtOpenApiViewerBranch}"

  ckanExtRssSource = "${var.ckanExtRssSource}"
  ckanExtRss = "${var.ckanExtRss}"
  ckanExtRssBranch = "${var.ckanExtRssBranch}"

  ckanExtDisqus = "${var.ckanExtDisqus}"
  ckanExtDisqusBranch = "${var.ckanExtDisqusBranch}"
  ckanExtGaReport = "${var.ckanExtGaReport}"
  ckanExtGaReportBranch = "${var.ckanExtGaReportBranch}"
  ckanExtGeoview = "${var.ckanExtGeoview}"
  ckanExtGeoviewBranch = "${var.ckanExtGeoviewBranch}"
  ckanExtGoogleAnalytics = "${var.ckanExtGoogleAnalytics}"
  ckanExtGoogleAnalyticsBranch = "${var.ckanExtGoogleAnalyticsBranch}"
  ckanExtHierarchy = "${var.ckanExtHierarchy}"
  ckanExtHierarchyBranch = "${var.ckanExtHierarchyBranch}"

  ckanExtDatapusher = "${var.ckanExtDatapusher}"
  ckanExtDatapusherBranch = "${var.ckanExtDatapusherBranch}"


  solrRepo = "${var.solrRepo}"
  solrTag = "${var.solrTag}"

  postgresRepo = "${var.postgresRepo}"
  postgresTag = "${var.postgresTag}"

  redisRepo = "${var.redisRepo}"
  redisTag = "${var.redisTag}"


  solrCore = "${var.solrCore}"
  solrPort = "${var.solrPort}"

  postgresDb = "${var.postgresDb}"
  postgresUser = "${var.postgresUser}"
  postgresPass = "${var.postgresPass}"
  postgresPort = "${var.postgresPort}"

  redisPort = "${var.redisPort}"

  ckanPlugins = "${var.ckanPlugins}"
  ckanVersion = "${var.ckanVersion}"

  confFolder = "${path.root}/${local.installPath}/conf"
  dbFolder = "${path.root}/db"
  logFolder = "${path.root}/${local.installPath}/logs"
  solrFolder = "${path.root}/${local.installPath}/solr"

  gaID="${var.gaID}"
  gaAccount="${var.gaAccount}"
  gaUser="${var.gaUser}"


  postgresInitCommand = <<EOF
sleep 30;
echo "CREATE ROLE postgres WITH SUPERUSER CREATEDB CREATEROLE LOGIN PASSWORD 'postgres';" | docker exec -i ckan_postgres-${replace(path.root, "/", ".")}.${replace(local.installPath, "/", ".")} psql -U ${local.postgresUser};
echo "CREATE DATABASE datastore" | docker exec -i ckan_postgres-${replace(path.root, "/", ".")}.${replace(local.installPath, "/", ".")} psql -U ${local.postgresUser};
cat ${local.dbFolder}/ckan.dump | docker exec -i ckan_postgres-${replace(path.root, "/", ".")}.${replace(local.installPath, "/", ".")} pg_restore -U ${local.postgresUser} -d ${local.postgresDb};
EOF

  solrConf = <<EOF
<?xml version="1.0" encoding="UTF-8"?>

<!--solrconfig.xml documentation [https://wiki.apache.org/solr/SolrConfigXml]-->
<config>

	<luceneMatchVersion>6.0.0</luceneMatchVersion>

	<lib dir="$${solr.install.dir:../../../..}/contrib/extraction/lib" regex=".*\.jar" />
	<lib dir="$${solr.install.dir:../../../..}/dist/" regex="solr-cell-\d.*\.jar" />
	<lib dir="$${solr.install.dir:../../../..}/contrib/clustering/lib/" regex=".*\.jar" />
	<lib dir="$${solr.install.dir:../../../..}/dist/" regex="solr-clustering-\d.*\.jar" />
	<lib dir="$${solr.install.dir:../../../..}/contrib/langid/lib/" regex=".*\.jar" />
	<lib dir="$${solr.install.dir:../../../..}/dist/" regex="solr-langid-\d.*\.jar" />
	<lib dir="$${solr.install.dir:../../../..}/contrib/velocity/lib" regex=".*\.jar" />
	<lib dir="$${solr.install.dir:../../../..}/dist/" regex="solr-velocity-\d.*\.jar" />

	<dataDir>$${solr.data.dir:}</dataDir>

	<directoryFactory name="DirectoryFactory" class="$${solr.directoryFactory:solr.NRTCachingDirectoryFactory}" />

	<codecFactory class="solr.SchemaCodecFactory" />

	<indexConfig>
		<lockType>$${solr.lock.type:native}</lockType>
	</indexConfig>

	<jmx />

	<updateHandler class="solr.DirectUpdateHandler2">

		<updateLog>
			<str name="dir">$${solr.ulog.dir:}</str>
			<int name="numVersionBuckets">$${solr.ulog.numVersionBuckets:65536}</int>
		</updateLog>

		<autoCommit>
			<maxTime>$${solr.autoCommit.maxTime:15000}</maxTime>
			<openSearcher>false</openSearcher>
		</autoCommit>

		<autoSoftCommit>
			<maxTime>$${solr.autoSoftCommit.maxTime:-1}</maxTime>
		</autoSoftCommit>

	</updateHandler>

	<query>

		<maxBooleanClauses>1024</maxBooleanClauses>
		<filterCache class="solr.FastLRUCache" size="512" initialSize="512" autowarmCount="0" />
		<queryResultCache class="solr.LRUCache" size="512" initialSize="512" autowarmCount="0" />
		<documentCache class="solr.LRUCache" size="512" initialSize="512" autowarmCount="0" />
		<cache name="perSegFilter" class="solr.search.LRUCache" size="10" initialSize="0" autowarmCount="10" regenerator="solr.NoOpRegenerator" />
		<enableLazyFieldLoading>true</enableLazyFieldLoading>
		<queryResultWindowSize>20</queryResultWindowSize>
		<queryResultMaxDocsCached>200</queryResultMaxDocsCached>

		<listener event="newSearcher" class="solr.QuerySenderListener">
			<arr name="queries" />
		</listener>

		<listener event="firstSearcher" class="solr.QuerySenderListener">
			<arr name="queries" />
		</listener>

		<useColdSearcher>false</useColdSearcher>
		<maxWarmingSearchers>2</maxWarmingSearchers>

	</query>

	<requestDispatcher handleSelect="false">

		<requestParsers enableRemoteStreaming="true" multipartUploadLimitInKB="2048000" formdataUploadLimitInKB="2048" addHttpRequestToContext="false" />
		<httpCaching never304="true" />

	</requestDispatcher>

	<requestHandler name="/select" class="solr.SearchHandler">

		<lst name="defaults">
			<str name="echoParams">explicit</str>
			<int name="rows">10</int>
		</lst>

	</requestHandler>

	<requestHandler name="/query" class="solr.SearchHandler">

		<lst name="defaults">
			<str name="echoParams">explicit</str>
			<str name="wt">json</str>
			<str name="indent">true</str>
		</lst>

	</requestHandler>

	<requestHandler name="/browse" class="solr.SearchHandler" useParams="query,facets,velocity,browse">

		<lst name="defaults">
			<str name="echoParams">explicit</str>
		</lst>

	</requestHandler>

	<initParams path="/update/**,/query,/select,/tvrh,/elevate,/spell,/browse">

		<lst name="defaults">
			<str name="df">_text_</str>
		</lst>

	</initParams>

	<initParams path="/update/**">

		<lst name="defaults">
			<str name="update.chain">add-unknown-fields-to-the-schema</str>
		</lst>

	</initParams>

	<requestHandler name="/update/extract" startup="lazy" class="solr.extraction.ExtractingRequestHandler">

		<lst name="defaults">
			<str name="lowernames">true</str>
			<str name="fmap.meta">ignored_</str>
			<str name="fmap.content">_text_</str>
		</lst>

	</requestHandler>

	<requestHandler name="/analysis/field" startup="lazy" class="solr.FieldAnalysisRequestHandler" />
	<requestHandler name="/analysis/document" class="solr.DocumentAnalysisRequestHandler" startup="lazy" />

	<requestHandler name="/debug/dump" class="solr.DumpRequestHandler">

		<lst name="defaults">
			<str name="echoParams">explicit</str>
			<str name="echoHandler">true</str>
		</lst>

	</requestHandler>

	<searchComponent name="spellcheck" class="solr.SpellCheckComponent">

		<str name="queryAnalyzerFieldType">text_general</str>

		<lst name="spellchecker">
			<str name="name">default</str>
			<str name="field">_text_</str>
			<str name="classname">solr.DirectSolrSpellChecker</str>
			<str name="distanceMeasure">internal</str>
			<float name="accuracy">0.5</float>
			<int name="maxEdits">2</int>
			<int name="minPrefix">1</int>
			<int name="maxInspections">5</int>
			<int name="minQueryLength">4</int>
			<float name="maxQueryFrequency">0.01</float>
		</lst>

	</searchComponent>

	<requestHandler name="/spell" class="solr.SearchHandler" startup="lazy">

		<lst name="defaults">
			<str name="spellcheck.dictionary">default</str>
			<str name="spellcheck">on</str>
			<str name="spellcheck.extendedResults">true</str>
			<str name="spellcheck.count">10</str>
			<str name="spellcheck.alternativeTermCount">5</str>
			<str name="spellcheck.maxResultsForSuggest">5</str>
			<str name="spellcheck.collate">true</str>
			<str name="spellcheck.collateExtendedResults">true</str>
			<str name="spellcheck.maxCollationTries">10</str>
			<str name="spellcheck.maxCollations">5</str>
		</lst>

		<arr name="last-components">
			<str>spellcheck</str>
		</arr>

	</requestHandler>

	<searchComponent name="tvComponent" class="solr.TermVectorComponent" />

	<requestHandler name="/tvrh" class="solr.SearchHandler" startup="lazy">

		<lst name="defaults">
			<bool name="tv">true</bool>
		</lst>
		<arr name="last-components">
			<str>tvComponent</str>
		</arr>

	</requestHandler>

	<searchComponent name="terms" class="solr.TermsComponent" />

	<requestHandler name="/terms" class="solr.SearchHandler" startup="lazy">

		<lst name="defaults">
			<bool name="terms">true</bool>
			<bool name="distrib">false</bool>
		</lst>

		<arr name="components">
			<str>terms</str>
		</arr>

	</requestHandler>

	<searchComponent name="elevator" class="solr.QueryElevationComponent">

		<str name="queryFieldType">string</str>
		<str name="config-file">elevate.xml</str>

	</searchComponent>

	<requestHandler name="/elevate" class="solr.SearchHandler" startup="lazy">

		<lst name="defaults">
			<str name="echoParams">explicit</str>
		</lst>
		<arr name="last-components">
			<str>elevator</str>
		</arr>

	</requestHandler>

	<searchComponent class="solr.HighlightComponent" name="highlight">

		<highlighting>

			<fragmenter name="gap" default="true" class="solr.highlight.GapFragmenter">
				<lst name="defaults">
					<int name="hl.fragsize">100</int>
				</lst>
			</fragmenter>

			<fragmenter name="regex" class="solr.highlight.RegexFragmenter">
				<lst name="defaults">
					<int name="hl.fragsize">70</int>
					<float name="hl.regex.slop">0.5</float>
					<str name="hl.regex.pattern">[-\w ,/\n\"']{20,200}</str>
				</lst>
			</fragmenter>

			<formatter name="html" default="true" class="solr.highlight.HtmlFormatter">
				<lst name="defaults">
					<str name="hl.simple.pre"><![CDATA[<em>]]></str>
					<str name="hl.simple.post"><![CDATA[</em>]]></str>
				</lst>
			</formatter>

			<encoder name="html" class="solr.highlight.HtmlEncoder" />
			<fragListBuilder name="simple" class="solr.highlight.SimpleFragListBuilder" />
			<fragListBuilder name="single" class="solr.highlight.SingleFragListBuilder" />
			<fragListBuilder name="weighted" default="true" class="solr.highlight.WeightedFragListBuilder" />
			<fragmentsBuilder name="default" default="true" class="solr.highlight.ScoreOrderFragmentsBuilder" />
			<fragmentsBuilder name="colored" class="solr.highlight.ScoreOrderFragmentsBuilder">

				<lst name="defaults">
					<str name="hl.tag.pre"><![CDATA[<b style="background:yellow">,<b style="background:lawgreen">,
               <b style="background:aquamarine">,<b style="background:magenta">,
               <b style="background:palegreen">,<b style="background:coral">,
               <b style="background:wheat">,<b style="background:khaki">,
               <b style="background:lime">,<b style="background:deepskyblue">]]></str>
					<str name="hl.tag.post"><![CDATA[</b>]]></str>
				</lst>

			</fragmentsBuilder>

			<boundaryScanner name="default" default="true" class="solr.highlight.SimpleBoundaryScanner">
				<lst name="defaults">
					<str name="hl.bs.maxScan">10</str>
					<str name="hl.bs.chars">.,!?</str>
				</lst>
			</boundaryScanner>

			<boundaryScanner name="breakIterator" class="solr.highlight.BreakIteratorBoundaryScanner">
				<lst name="defaults">
					<str name="hl.bs.type">WORD</str>
					<str name="hl.bs.language">en</str>
					<str name="hl.bs.country">US</str>
				</lst>
			</boundaryScanner>

		</highlighting>

	</searchComponent>

	<schemaFactory class="ClassicIndexSchemaFactory" />

	<updateRequestProcessorChain name="add-unknown-fields-to-the-schema">
		<processor class="solr.UUIDUpdateProcessorFactory" />
		<processor class="solr.LogUpdateProcessorFactory" />
		<processor class="solr.DistributedUpdateProcessorFactory" />
		<processor class="solr.RemoveBlankFieldUpdateProcessorFactory" />
		<processor class="solr.FieldNameMutatingUpdateProcessorFactory">
			<str name="pattern">[^\w-\.]</str>
			<str name="replacement">_</str>
		</processor>
		<processor class="solr.ParseBooleanFieldUpdateProcessorFactory" />
		<processor class="solr.ParseLongFieldUpdateProcessorFactory" />
		<processor class="solr.ParseDoubleFieldUpdateProcessorFactory" />
		<processor class="solr.ParseDateFieldUpdateProcessorFactory">
			<arr name="format">
				<str>yyyy-MM-dd'T'HH:mm:ss.SSSZ</str>
				<str>yyyy-MM-dd'T'HH:mm:ss,SSSZ</str>
				<str>yyyy-MM-dd'T'HH:mm:ss.SSS</str>
				<str>yyyy-MM-dd'T'HH:mm:ss,SSS</str>
				<str>yyyy-MM-dd'T'HH:mm:ssZ</str>
				<str>yyyy-MM-dd'T'HH:mm:ss</str>
				<str>yyyy-MM-dd'T'HH:mmZ</str>
				<str>yyyy-MM-dd'T'HH:mm</str>
				<str>yyyy-MM-dd HH:mm:ss.SSSZ</str>
				<str>yyyy-MM-dd HH:mm:ss,SSSZ</str>
				<str>yyyy-MM-dd HH:mm:ss.SSS</str>
				<str>yyyy-MM-dd HH:mm:ss,SSS</str>
				<str>yyyy-MM-dd HH:mm:ssZ</str>
				<str>yyyy-MM-dd HH:mm:ss</str>
				<str>yyyy-MM-dd HH:mmZ</str>
				<str>yyyy-MM-dd HH:mm</str>
				<str>yyyy-MM-dd</str>
			</arr>
		</processor>
		<processor class="solr.RunUpdateProcessorFactory" />
	</updateRequestProcessorChain>

	<queryResponseWriter name="json" class="solr.JSONResponseWriter">
		<str name="content-type">text/plain; charset=UTF-8</str>
	</queryResponseWriter>

	<queryResponseWriter name="velocity" class="solr.VelocityResponseWriter" startup="lazy">
		<str name="template.base.dir">$${velocity.template.base.dir:}</str>
		<str name="solr.resource.loader.enabled">$${velocity.solr.resource.loader.enabled:true}</str>
		<str name="params.resource.loader.enabled">$${velocity.params.resource.loader.enabled:false}</str>
	</queryResponseWriter>

	<queryResponseWriter name="xslt" class="solr.XSLTResponseWriter">
		<int name="xsltCacheLifetimeSeconds">5</int>
	</queryResponseWriter>

</config>

EOF

  solrInitCommand = <<EOF
set +e
cd ${local.solrFolder}/conf;
wget https://raw.githubusercontent.com/ckan/ckan/${local.ckanVersion}/ckan/config/solr/schema.xml;
wget https://raw.githubusercontent.com/apache/lucene-solr/releases/lucene-solr/6.0.0/solr/server/solr/configsets/basic_configs/conf/currency.xml;
wget https://raw.githubusercontent.com/apache/lucene-solr/releases/lucene-solr/6.0.0/solr/server/solr/configsets/basic_configs/conf/synonyms.txt;
wget https://raw.githubusercontent.com/apache/lucene-solr/releases/lucene-solr/6.0.0/solr/server/solr/configsets/basic_configs/conf/stopwords.txt;
wget https://raw.githubusercontent.com/apache/lucene-solr/releases/lucene-solr/6.0.0/solr/server/solr/configsets/basic_configs/conf/protwords.txt;
wget https://raw.githubusercontent.com/apache/lucene-solr/releases/lucene-solr/6.0.0/solr/server/solr/configsets/data_driven_schema_configs/conf/elevate.xml;
echo name=${local.solrCore} > ${local.solrFolder}/core.properties
set -e
EOF

}