#!/bin/bash
#
# This script builds the application image through docker and deploys it to your Heroku instance.
#
# You can pass 1 parameter to the script in order to be able to deploy
# the application to multiple environments.
#
# ex.
# ./scripts/docker.sh staging
#
# Possible environments are:
#  - develop
#  - staging
#  - production
#
# Now let's deploy like a baws. 🤓
#

# exit 1 on errors
set -e

# Set the following variables for deployment:
#  - heroku project
#  - deployment branch
deploy_environment=$1
if [[ "$deploy_environment" == "develop" ]]
then
  echo "Deploying to develop"
  heroku_project='develop-heroku-project'
  deployment_branch='origin/develop'
elif [ "$deploy_environment" == "staging" ]
then
  echo "Deploying to staging"
  heroku_project='staging-heroku-project'
  deployment_branch='origin/beta'
elif [ "$deploy_environment" == "production" ]
then
  echo "Deploying to production"
  heroku_project='production-heroku-project'
  deployment_branch='origin/master'
else
  exit "You passed the incorrect environment argument. One of theses (staging) should be given."
fi

# Log the shell command in the console and run it afterwards.
function run {
  echo $1
  $1
}

# Setup heroku remote if the git remote exists. If not create the remote
echo "Checking if remote exists..."
if ! git ls-remote heroku; then
  echo "Adding heroku..."
  run "git remote add heroku git@heroku.com:$heroku_project.git"
fi

# Keep track of the previous Heroku build number.
previous_heroku_build_version=`/usr/local/bin/heroku releases | sed -n 2p | awk '{print $1}'`

# Build the image using docker and push it to heroku
echo "deploying with docker"
run "heroku container:push web"

# Fetch the new build version number.
heroku_build_version=`/usr/local/bin/heroku releases | sed -n 2p | awk '{print $1}'`

# Only tag the current commit when the build version is different from the previous one.
if [[ "$previous_heroku_build_version" != $heroku_build_version ]]
then
  # Tag the current commit with the Heroku deploy version.
  echo "Tagging the current commit..."
  run "git tag -a $deploy_environment/$heroku_build_version -m Build"
  run "git push -f origin $deploy_environment/$heroku_build_version"
fi
