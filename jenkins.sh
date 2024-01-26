#!/bin/bash

echo "Installing Jenkins LTS"

sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install -y jenkins

echo "Installing Java 17"

sudo apt install -y fontconfig openjdk-17-jre
sudo systemctl enable jenkins
sudo systemctl start jenkins

sleep 1m

echo "Jenkins URL: http://localhost:8080"
JENKINSPWD=$(sudo cat /var/lib/jenkins/secrets/initialAdminPassword)
echo "Administrator password: $JENKINSPWD"
