#!/bin/bash

SUNWAIT_LOCATION="40.7143W -74.0060E"

sunwait wait rise $SUNWAIT_LOCATION
./sol.sh

sunwait wait set $SUNWAIT_LOCATION
./luna.sh
