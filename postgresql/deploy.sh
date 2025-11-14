#!/bin/bash

set -e

# 既存のNFSボリューム(vol-data)が存在しない場合は作成
if ! docker volume inspect vol-data &>/dev/null; then
  echo "Creating NFS volume 'vol-data'..."
  docker volume create --driver local --opt type=nfs --opt o=addr=172.21.9.222,rw --opt device=:/docker-vol vol-data
fi

# スタックをデプロイ
docker stack deploy --compose-file docker-compose.yaml postgresql

echo "PostgreSQL deployment completed successfully!"
echo ""
echo "To check the status:"
echo "  docker service ls | grep postgresql"
echo "  docker service logs postgresql_postgresql"
