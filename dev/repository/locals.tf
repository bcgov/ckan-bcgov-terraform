variable "repoSource"{
  type = "string"
  default = "https://github.com"
}

variable "repoPath"{
  type = "string"
  default = "ckan/ckan"
}

variable "branch"{
  type = "string"
  default = "master"
}

variable "installPath"{
  type = "string"
  default = "ckan"
}

variable "preferFork"{
  type = "string"
  default = "1"
}

variable "gitUsername" {
  type = "string"
  default = ""
}

variable "vEnv" {
  type = "map"
  default = {}
}

locals{
  repoSource = "${var.repoSource}"
  repoPath = "${var.repoPath}"
  branch = "${var.branch}"
  installPath = "${var.installPath}"
  preferFork = "${var.preferFork}"
  gitUsername = "${var.gitUsername}"
  gitFinalPath = "${element(split("/", local.repoPath), 1)}"


  command = <<EOF
cd ${path.root}/${local.installPath};
REPO_URL=${local.repoSource}/${local.repoPath}.git;
FORKED=0;
set +e
eval git ls-remote ${local.repoSource}/${local.gitUsername}/${local.gitFinalPath} > /dev/null 2>&1;
RESULT=$?;
set -e
if [ $RESULT == 0 ]; then
    REPO_URL=${local.repoSource}/${local.gitUsername}/${local.gitFinalPath}.git;
    FORKED=1;
fi
git clone $REPO_URL;
cd ${local.gitFinalPath};
if [ $FORKED == 1 ]; then
    git remote add forkedFrom ${local.repoSource}/${local.repoPath}.git;
fi

git checkout ${local.branch}
THIS_MAKES_ME_WAIT="${var.vEnv["output"]}";
source ${path.root}/${local.installPath}/venv/bin/activate;
set +e
pip install -r requirements.txt;
python setup.py develop;
echo "done" #this makes the command exit with a positive result
set -e;

cd ${path.root};
EOF

}