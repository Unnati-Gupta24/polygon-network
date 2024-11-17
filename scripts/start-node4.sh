#!/bin/bash

LOG_DIR="./data/node4/logs"
mkdir -p $LOG_DIR

polygon-edge server     --data-dir ./data/node4     --chain ./config/genesis.json     --grpc-address :40000     --libp2p :40001     --jsonrpc :40002     --seal     --log-level DEBUG     --log-to $LOG_DIR/node.log
