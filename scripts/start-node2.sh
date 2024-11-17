#!/bin/bash

LOG_DIR="./data/node2/logs"
mkdir -p $LOG_DIR

polygon-edge server     --data-dir ./data/node2     --chain ./config/genesis.json     --grpc-address :20000     --libp2p :20001     --jsonrpc :20002     --seal     --log-level DEBUG     --log-to $LOG_DIR/node.log
