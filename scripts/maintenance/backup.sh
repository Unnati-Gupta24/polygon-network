#!/bin/bash

BACKUP_DIR="./backup/snapshots"
DATE=$(date +%Y%m%d_%H%M%S)

# Create backup directory if it doesn't exist
mkdir -p $BACKUP_DIR

# Backup each node's data
for i in {1..4}; do
    NODE_DIR="./data/node$i"
    BACKUP_FILE="$BACKUP_DIR/node${i}_${DATE}.tar.gz"
    
    # Stop the node gracefully
    pkill -f "polygon-edge.*node$i"
    
    # Create backup
    tar -czf $BACKUP_FILE $NODE_DIR
    
    echo "Backup created: $BACKUP_FILE"
done
