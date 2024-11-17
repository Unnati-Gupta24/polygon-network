#!/bin/bash

# Network upgrade script
VERSION=$1
BACKUP_DIR="./backup/pre_upgrade_$(date +%Y%m%d)"

# Create backup before upgrade
./backup.sh $BACKUP_DIR

# Stop all nodes
for i in {1..4}; do
    echo "Stopping node $i..."
    pkill -f "polygon-edge.*node$i"
done

# Update polygon-edge binary
echo "Updating polygon-edge to version $VERSION..."
cd /tmp
git clone https://github.com/0xPolygon/polygon-edge.git
cd polygon-edge
git checkout $VERSION
go build -o polygon-edge main.go
sudo mv polygon-edge /usr/local/bin/

# Restart nodes
for i in {1..4}; do
    echo "Starting node $i..."
    ./scripts/start-node$i.sh &
done

echo "Network upgrade complete"