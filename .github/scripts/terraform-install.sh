#!/bin/bash
apt update && apt install -y wget unzip
cd /tmp && wget https://releases.hashicorp.com/terraform/1.5.6/terraform_1.5.6_linux_amd64.zip
unzip terraform_1.5.6_linux_amd64.zip && cp terraform /usr/bin