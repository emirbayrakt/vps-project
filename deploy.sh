#!/bin/bash

echo "🚀 Deploy script started at $(date)"

cd /home/deployer/project || exit

echo "📦 Pulling Node.js API..."
cd node && git pull || exit
cd ..

echo "📦 Pulling React frontend..."
cd react && git pull || exit
cd ..

echo "🐳 Pulling latest Docker images..."
docker compose pull

echo "🔧 Rebuilding and restarting containers..."
docker compose up --build -d

echo "✅ Deployment finished at $(date)"

