#!/bin/bash

echo 'Installing OpenJDK 8 Package...'
sudo yum install java-1.8.0-openjdk-devel -y

echo 'Enabling Jenkins repository...'
curl --silent --location http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo | sudo tee /etc/yum.repos.d/jenkins.repo
echo 'Adding repository to system...'
sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key

echo 'Installing latest stable version of Jenkins..'
sudo yum install jenkins -y

echo 'Starting Jenkins service...'
sudo systemctl start jenkins && systemctl status jenkins && sudo systemctl enable jenkins

sleep 1m

echo "Jernkins URL: http://localhost:8080"
JENKINSPWD=$(sudo cat /var/lib/jenkins/secrets/initialAdminPassword)
echo "Administrator password: $JENKINSPWD"
