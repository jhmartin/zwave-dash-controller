#!/bin/bash
source ~/.dashlogin
#ZUSER=user
#ZPASS=password
#ZIP=hostname
TMPFILE=`mktemp`

/usr/bin/curl -XPOST http://$ZIP:8083/ZAutomation/api/v1/login -d '{"form":true,"login":"$ZUSER","password":"$ZPASS","keepme":false,"default_ui":1}' -v -i --header "Content-Type: application/json;charset=utf-8" -c $TMPFILE
/usr/bin/curl http://$ZIP:8083/ZAutomation/api/v1/devices/ZWayVDev_zway_13-0-37/command/on -b $TMPFILE
sleep 5
/usr/bin/curl http://$ZIP:8083/ZAutomation/api/v1/devices/LightScene_29/command/on -b $TMPFILE
sleep 60
/usr/bin/curl http://$ZIP:8083/ZAutomation/api/v1/devices/ZWayVDev_zway_45-0-98/command/close -b $TMPFILE
/usr/bin/curl http://$ZIP:8083/ZAutomation/api/v1/devices/ZWayVDev_zway_53-0-98/command/close -b $TMPFILE
