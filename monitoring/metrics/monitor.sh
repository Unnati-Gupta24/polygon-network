#!/bin/bash

# Monitor node status
check_node_status() {
    local port=$1
    curl -s -X POST --data '{"jsonrpc":"2.0","method":"net_listening","params":[],"id":1}'         -H "Content-Type: application/json"         http://localhost:$port
}

# Monitor peer count
check_peer_count() {
    local port=$1
    curl -s -X POST --data '{"jsonrpc":"2.0","method":"net_peerCount","params":[],"id":1}'         -H "Content-Type: application/json"         http://localhost:$port
}

# Monitor block height
check_block_height() {
    local port=$1
    curl -s -X POST --data '{"jsonrpc":"2.0","method":"eth_blockNumber","params":[],"id":1}'         -H "Content-Type: application/json"         http://localhost:$port
}

# Main monitoring loop
while true; do
    echo "=== Node Status Report ==="
    echo "Node 1: $(check_node_status 10002)"
    echo "Node 2: $(check_node_status 20002)"
    echo "Node 3: $(check_node_status 30002)"
    echo "Node 4: $(check_node_status 40002)"
    
    echo -e "\n=== Peer Count ==="
    echo "Node 1: $(check_peer_count 10002)"
    echo "Node 2: $(check_peer_count 20002)"
    echo "Node 3: $(check_peer_count 30002)"
    echo "Node 4: $(check_peer_count 40002)"
    
    echo -e "\n=== Block Heights ==="
    echo "Node 1: $(check_block_height 10002)"
    echo "Node 2: $(check_block_height 20002)"
    echo "Node 3: $(check_block_height 30002)"
    echo "Node 4: $(check_block_height 40002)"
    
    sleep 60
done
