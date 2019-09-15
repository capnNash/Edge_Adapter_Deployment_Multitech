#!/bin/bash

opkg install openjdk-8
mkdir /usr/lib/jvm/openjdk-8/jre/lib/arm/jamvm
cd /usr/lib/jvm/openjdk-8/jre/lib/arm/jamvm/
cp /usr/lib/jvm/openjdk-8/jre/lib/arm/server/libjvm.so .