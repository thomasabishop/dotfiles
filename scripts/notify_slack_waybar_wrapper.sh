#!/bin/bash

source /home/thomas/.env

# Execute the Slack notifier script with arguments passed to this wrapper
/home/thomas/repos/slack-notifier/src/index.js "$@"
