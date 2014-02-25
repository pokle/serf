#!/usr/bin/env bash
#
# Lists all members

CONTAINER=${1-serf1}

cd $(dirname $0)

docker run -rm -i -t poklet/serf serf members -rpc-addr=$(./ipof.sh $CONTAINER):7373
