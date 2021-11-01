[![Lifecycle:Dormant](https://img.shields.io/badge/Lifecycle-Dormant-ff7f2a)](<Redirect-URL>)

# CKAN Terraform
The purpose of this repo is to install a version of CKAN for development, an assumption is made
that you are working on the catalogue but with some tweaks it could work for any version of ckan.
(Once terraform 12 comes out the repo could(and should) be changed to a list / for loop)

## Requirements
This procedure does not make any assumptions about your OS, and therefore you must have installed
- pip
- python
- openssl (Mac - Note: You may also have to copy files over from Cellar [brew install] to /usr/local/lib)
- terraform (https://www.terraform.io/downloads.html) (v 0.11.7)
- wget
- git cli is logged in with automatic access to new repos on github/gogs
- libmagic c library is installed (`brew install libmagic` on Mac)

## Steps to install
1) Copy terraform.tfvars.example to terraform.tfvars.
2) (OPTIONAL) add a db dump file to ./db called ckan.dump and it will be imported automatically
3) Modify the contents  to match your needs
4) Run `terraform init` to initialize all the modules from remote
5) (OPTIONAL) Run `terraform plan` to see what the command intends to do
6) Run `terraform apply` and you'll see the same output as step 4 above respond yes and let
terraform do it's job

## Notes about TFVars
- Install path is relative to the root of this directory (the directory of this README file)

## Manual steps
Some files are intentionally omitted from this install process as they are confidential. So follow the steps below
1) source ${path.root}/${local.installPath}/venv/bin/activate;
2) pip install ckanext-pdfview==0.0.5
3) pip install sqlalchemy==0.9
4) pip install genshi==0.7.1
5) pip install flask_debugtoolbar==0.10.1
6) Provide the bcdc_licenses.json file in {installPath}/ckanext-bcgov/ckanext/bcgov/scripts/data/bcdc_licenses.json
7) Then run solr indexing, (See #Solr)
8) If you do not want to be on the master branches for a particular Repo you must check it on and
re-run the pip/python install.


## Running
1) Activate the venv `source {installPath}/venv/bin/activate` (Note you should now be able to run paster commands
2) cd into `{installPath}/ckanext-bcgov` (or whatever extension you're working on)
3) Run with `paster serve --reload --reload-interval=2 ../conf/ckan.ini`

## Parallelism Conundrum
There is a problem where if you run terraform apply as normal the venv will not be set up perfectly.
This is due to it installing things into that environment in parallel. There is at present 3 work arounds.
Listed in order of there effectiveness (higher numbers are better)
1) Install the plugins manually (python setup.py develop) for every repo that it fetches
2) Run `terraform apply -parallelism=1` this limits parallelism and solves the problem but takes longer to install the non repos
3) Run `terraform apply` after it finishes nuke the .*.tf files in {installPath} and then run `terraform apply -parallelism=1`

I haven't found a good solution to this via code, that doesn't mean that one doesn't exist

## Solr
To index the solr database run `paster --plugin=ckan search-index rebuild -c {installPath}/conf/ckan.ini`

## Datastore
To create the datastore you need to run an additional command.
1) Activate the venv `source {installPath}/venv/bin/activate`
2) `paster --plugin=ckan datastore set-permissions -c conf/ckan.ini | docker exec -i ckan_postgres-.{installPathWithDots} psql -U ckan`

## Datapusher
To run the datapusher
1) Activate the venv `source {installPath}/venv/bin/activate`
2) cd to {installPath}/datapusher
3) python datapusher/main.py deployment/datapusher_settings.py

## Creating a User
1) Activate the venv `source {installPath}/venv/bin/activate` (Note you should now be able to run paster commands
2) `paster --plugin=ckan user add <username> email=<address> -c {installPath}/conf/ckan.ini`
3) (Optional if you want admin privileges) `paster --plugin=ckan sysadmin add <username> email=<address> -c {installPath}/conf/ckan.ini`

## Troubleshooting
Sometimes the terraform execution will fail for one of the repos. When it does this
you will get an error along the lines of
```
1 error(s) occurred:

* module.dev.module.ckanextGaReportRepo.local_file.repo: Error running command...
```

When this happens delete the file in the install path that corresponding file.
In the case above `.ckanext-ga-report.tf` and retry the terraform apply (note it will only do work thats required)

If the postgres container starts and shutdown immediately the permissions on your db folder are probably incorrect.
Make sure that they are global read/writable

Copyright 2019, Province of British Columbia.
