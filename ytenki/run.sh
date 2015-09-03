#!/bin/bash
service memcached start
cd /app && TZ='Asia/Tokyo' DISPLAY=localhost:1.0 xvfb-run bundle exec unicorn -E production -c /app/unicorn.rb
