#!/bin/bash
#
apikey='XYZ-blahblah'

url="https://artifactory.bf-aws.illumina.com/artifactory/archive-platformservices-internal-snapshot/com/illumina/platformservices/"

snapshot=2.1.1-SNAPSHOT
#

for i in `curl -H "X-JFrog-Art-Api:$apikey" -s $url|awk -F ">" '{print $2}'|awk -F"/" '{print $1}'|grep -v "<"|sed '/^$/d'|grep -v Index`
do
  echo "delete - $url/$i/$snapshot"
  curl -H "X-JFrog-Art-Api:$apikey" -X DELETE $url/$i/$snapshot
  echo "========="
done
