locals{
  virtualCmd = "virtualenv --no-site-packages --python=python2 ${path.root}/${local.installPath}/venv;"
}

data "external" "virtualEnv"{
  program = ["echo", "{\"output\": \"$(${local.virtualCmd})\"}"]
}

module "ckanRepo" {
  source = "repository"
  installPath = "${local.installPath}"
  branch = "${local.ckanBranch}"
  repoPath = "${local.ckanRepo}"
  preferFork = "${local.preferFork}"
  gitUsername = "${local.gitUsername}"
  vEnv = "${data.external.virtualEnv.result}"
}

module "ckanextBcGovRepo" {
  source = "repository"
  installPath = "${local.installPath}"
  repoPath = "${local.ckanExtBcGov}"
  branch = "${local.ckanExtBcGovBranch}"
  preferFork = "${local.preferFork}"
  gitUsername = "${local.gitUsername}"
  vEnv = "${data.external.virtualEnv.result}"
}

module "ckanextBcGovCliRepo" {
  source = "repository"
  installPath = "${local.installPath}"
  repoPath = "${local.ckanExtBcGovCli}"
  branch = "${local.ckanExtBcGovCliBranch}"
  preferFork = "${local.preferFork}"
  gitUsername = "${local.gitUsername}"
  vEnv = "${data.external.virtualEnv.result}"
}

module "ckanextDisqusRepo" {
  source = "repository"
  installPath = "${local.installPath}"
  repoPath = "${local.ckanExtDisqus}"
  branch = "${local.ckanExtDisqusBranch}"
  preferFork = "${local.preferFork}"
  gitUsername = "${local.gitUsername}"
  vEnv = "${data.external.virtualEnv.result}"
}

module "ckanextGaReportRepo" {
  source = "repository"
  installPath = "${local.installPath}"
  repoPath = "${local.ckanExtGaReport}"
  branch = "${local.ckanExtGaReportBranch}"
  preferFork = "${local.preferFork}"
  gitUsername = "${local.gitUsername}"
  vEnv = "${data.external.virtualEnv.result}"
}

module "ckanextGeoviewRepo" {
  source = "repository"
  installPath = "${local.installPath}"
  repoPath = "${local.ckanExtGeoview}"
  branch = "${local.ckanExtGeoviewBranch}"
  preferFork = "${local.preferFork}"
  gitUsername = "${local.gitUsername}"
  vEnv = "${data.external.virtualEnv.result}"
}

module "ckanextGoogleAnalyticsRepo" {
  source = "repository"
  installPath = "${local.installPath}"
  repoPath = "${local.ckanExtGoogleAnalytics}"
  branch = "${local.ckanExtGoogleAnalyticsBranch}"
  preferFork = "${local.preferFork}"
  gitUsername = "${local.gitUsername}"
  vEnv = "${data.external.virtualEnv.result}"
}

module "ckanextHierarchyRepo" {
  source = "repository"
  installPath = "${local.installPath}"
  repoPath = "${local.ckanExtHierarchy}"
  branch = "${local.ckanExtHierarchyBranch}"
  preferFork = "${local.preferFork}"
  gitUsername = "${local.gitUsername}"
  vEnv = "${data.external.virtualEnv.result}"
}

module "ckanextOpenApiViewerRepo" {
  source = "repository"
  installPath = "${local.installPath}"
  repoPath = "${local.ckanExtOpenApiViewer}"
  branch = "${local.ckanExtOpenApiViewerBranch}"
  preferFork = "${local.preferFork}"
  gitUsername = "${local.gitUsername}"
  vEnv = "${data.external.virtualEnv.result}"
}

module "ckanextDatapusherRepo" {
  source = "repository"
  installPath = "${local.installPath}"
  repoPath = "${local.ckanExtDatapusher}"
  branch = "${local.ckanExtDatapusherBranch}"
  preferFork = "${local.preferFork}"
  gitUsername = "${local.gitUsername}"
  vEnv = "${data.external.virtualEnv.result}"
}

module "ckanextRSSRepo" {
  source = "repository"
  installPath = "${local.installPath}"
  repoPath = "${local.ckanExtRss}"
  branch = "${local.ckanExtRssBranch}"
  repoSource = "${local.ckanExtRssSource}"
  preferFork = "${local.preferFork}"
  gitUsername = "${local.gitUsername}"
  vEnv = "${data.external.virtualEnv.result}"
}

module "ckanextSSORepo" {
  source = "repository"
  installPath = "${local.installPath}"
  repoPath = "${local.ckanExtSSO}"
  branch = "${local.ckanExtSSOBranch}"
  preferFork = "${local.preferFork}"
  gitUsername = "${local.gitUsername}"
  vEnv = "${data.external.virtualEnv.result}"
}

module "ckanUIRepo" {
  source = "repository"
  installPath = "${local.installPath}"
  repoPath = "${local.ckanUI}"
  branch = "${local.ckanUIBranch}"
  preferFork = "${local.preferFork}"
  gitUsername = "${local.gitUsername}"
  vEnv = "${data.external.virtualEnv.result}"
}

resource "null_resource" "finalTweaks"{
//  provisioner "local-exec" {
//    command = <<EOF
//source ${path.root}/${local.installPath}/venv/bin/activate;
//pip install ckanext-pdfview==0.0.5
//pip install sqlalchemy==0.9
//pip install genshi==0.7.1
//pip install flask_debugtoolbar==0.10.1
//EOF
//  }

  provisioner "local-exec"{
    command = "rm -rf ${path.root}/${local.installPath}/venv"
    when = "destroy"
  }
}