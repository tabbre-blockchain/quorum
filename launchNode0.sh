#!/bin/bash
NETWORK_ID=$(cat genesis.json | tr -d '\r' | grep chainId | awk -F " " '{print $2}' | awk -F "," '{print $1}')

DATADIR=" --datadir 0 "
ARGS="--nodiscover --verbosity 5 --istanbul.blockperiod 5 --networkid $NETWORK_ID --syncmode full --mine --minerthreads 1 --emitcheckpoints " 
PORT="--port 23000 "
geth $DATADIR $ARGS $PORT
