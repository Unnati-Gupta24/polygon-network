#!/bin/bash

LOG_DIR="./data/node3/logs"
mkdir -p $LOG_DIR

polygon-edge server     --data-dir ./data/node3     --chain ./config/genesis.json     --grpc-address :30000     --libp2p :30001     --jsonrpc :30002     --seal     --log-level DEBUG     --log-to $LOG_DIR/node.log
