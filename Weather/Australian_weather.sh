#!/bin/sh
cat weatherURLS.txt | xargs  wget -nc -r -np -l 1 -A json,axf
