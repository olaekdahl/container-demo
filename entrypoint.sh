#!/bin/bash

CONTAINER_ID=$(hostname)
export CONTAINER_ID
exec "$@"