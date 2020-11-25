#!/bin/bash

bin="/app/bin/yubaba"

eval "$bin eval \"Yubaba.Release.migrate\""
exec "$bin" "start"