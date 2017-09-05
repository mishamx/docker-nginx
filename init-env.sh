#!/usr/bin/env bash

cp -R /etc/nginx-source/ /etc/nginx/
/usr/local/bin/ep -v /etc/nginx/sites-enabled/*.conf
/usr/local/bin/ep -v /etc/nginx/*.conf -- /usr/sbin/nginx -g "daemon off;"