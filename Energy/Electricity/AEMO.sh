#!/bin/sh
cat electricityURLS.txt | xargs  wget -nc -r -np -l 1 -A zip,ZIP,csv,CSV,pdf,PDF,xlsx,txt,TXT
