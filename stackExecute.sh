#!/bin/bash

stack --docker-run-args='--net=bridge --publish=3000:3000' exec -- yesod devel
