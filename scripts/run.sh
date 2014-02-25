#!/usr/bin/env bash
#
cd $(dirname $0)

HOW_MANY=${1}
PREFIX=${2-serf}
IMAGE=${3-poklet/serf}

if [[ ${#@} = 0 ]]; then
  echo Runs multiple serf containers
  echo usage: $0 NUMBER-OF-CONTAINERS [HOSTNAME-PREFIX] [IMAGE-NAME]
  echo
  echo Defaults: HOSTNAME-PREFIX:$PREFIX, IMAGE-NAME:$IMAGE
  echo Example: $0 3      # => Runs 3 serf containers called serf1, serf2 & serf3
  echo Example: $0 1 demo # => Runs 1 serf container called demo1
  exit 1
fi

docker run -d -name=${PREFIX}1 $IMAGE serf agent -rpc-addr=0.0.0.0:7373
SEED=$(./ipof.sh ${PREFIX}1)

for (( instance=$HOW_MANY; $instance > 1; instance=$instance - 1 )); do
	docker run -d -name ${PREFIX}${instance} $IMAGE serf agent -join=$SEED
done

