#!/bin/bash

# 使用xargs优化
xargs -n1 -P10 curl --max-time 1 -s "http://{}:54321" < <(sed -nE 's/.*"ip": "([^"]+)".*/\1/p' scan.json) | while read -r res; do
    #使用并行处理
    if [[ "$res" =~ .*true.* ]]; then
      echo "$ip_ad" | tee -a week.log
    fi
    echo "$ip_ad" | tee -a all.log
done
