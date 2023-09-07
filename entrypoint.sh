#!/usr/bin/env bash
set -ex

exec sudo -E bash -c '/usr/bin/supervisord -c /etc/supervisor/supervisord.conf --nodaemon'




