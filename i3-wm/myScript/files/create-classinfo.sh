#!/bin/sh
# feature: creat class_info used by python

LOCAL=$HOME/.myScript/files
python $LOCAL/get-schedule-text.py > $LOCAL/classinfo.py
