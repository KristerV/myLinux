#!/bin/bash

echo "removeing evaluation key"
rm ~/.WebStorm2019.*/config/eval/WebStorm19*
rm ~/.IntelliJIdea2019.*/config/eval/WebStorm19*

echo "resetting evalsprt in other.xml"
sed -i '/evlsprt/d' ~/.WebStorm2019*/config/options/other.xml
sed -i '/evlsprt/d' ~/.IntelliJIdea2019*/config/options/other.xml

echo "resetting evalsprt in prefs.xml"
sed -i '/evlsprt/d' ~/.java/.userPrefs/prefs.xml

echo "Removing java stuff"
rm -rf ~/.java/.userPrefs/jetbrains/idea
rm -rf ~/.java/.userPrefs/jetbrains/webstorm
