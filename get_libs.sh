#!/usr/bin/env bash
curl -s https://raw.githubusercontent.com/BigWigsMods/packager/master/release.sh | bash -s -- -c -d -z -g bcc
mv .release/Broker_RunSpeed/libs .
