#!/bin/bash

curl -H "Content-Type: application/json" --data '{"build": true}' -X POST https://registry.hub.docker.com/u/lorcanoeire/base-spree-store/trigger/10822872-261f-4621-a617-d4ddb0bf6587/
