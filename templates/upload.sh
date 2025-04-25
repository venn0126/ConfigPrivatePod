#!/bin/bash

git stash
git pull origin master --tags
git stash pop

VersionString=`grep -E 's.version.*=' CTMediator.podspec`
VersionNumber=`tr -cd 0-9 <<<"$VersionString"`
NewVersionNumber=$(($VersionNumber + 1))
LineNumber=`grep -nE 's.version.*=' CTMediator.podspec | cut -d : -f1`

git add .
git commit -am ${NewVersionNumber}
git pull origin master --tags

sed -i "" "${LineNumber}s/${VersionNumber}/${NewVersionNumber}/g" CTMediator.podspec

echo "current version is ${VersionNumber}, new version is ${NewVersionNumber}"

git commit -am ${NewVersionNumber}
git tag ${NewVersionNumber}
git push origin main --tags
# 发布到CocoaPods 官方的 trunk 仓库
# pod trunk push ./TNFrameHandler.podspec --verbose --use-libraries --allow-warnings
