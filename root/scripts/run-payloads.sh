#!/usr/bin/env bash
set -ex
for i in `ls /scripts/payloads/*|sort`
do
[ -x "$i" ] && {
    "$i"
}
done