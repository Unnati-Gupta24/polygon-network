#!/bin/bash

LOG_DIR="./data/node1/logs"
mkdir -p $LOG_DIR

polygon-edge server     --data-dir ./data/node1     --chain ./config/genesis.json     --grpc-address :10000     --libp2p :10001     --jsonrpc :10002     --seal     --log-level DEBUG     --log-to $LOG_DIR/node.log
