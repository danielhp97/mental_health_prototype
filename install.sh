#!/bin/bash

ENV_FILE=".env"

# URLs for tar files hosted on GitHub Release
FRONTEND_URL="https://github.com/danielhp97/mental_health_prototype/releases/download/pre-release/frontend.tar"
BACKEND_URL="https://github.com/danielhp97/mental_health_prototype/releases/download/pre-release/backend.tar"
DATABASE_URL="https://github.com/danielhp97/mental_health_prototype/releases/download/pre-release/database.tar"
MESSAGING_URL="https://github.com/danielhp97/mental_health_prototype/releases/download/pre-release/messaging.tar"
AUTH_URL="https://github.com/danielhp97/mental_health_prototype/releases/download/pre-release/auth.tar"


if [ ! -f "$ENV_FILE" ]; then
  echo "❌ Environment file ($ENV_FILE) not found. Please ensure it exists."
  exit 1
fi

# Load .env file
echo "📂 Loading environment variables from $ENV_FILE..."
set -o allexport
source "$ENV_FILE"
set +o allexport

# Display loaded variables (optional)
echo "✅ Environment variables loaded:"
echo "FRONTEND_PORT=${FRONTEND_PORT}"
echo "BACKEND_PORT=${BACKEND_PORT}"
echo "DATABASE_PORT=${DATABASE_PORT}"
echo "AUTH_PORT=${AUTH_PORT}"
echo "MESSAGING_PORT=${MESSAGING_PORT}"

# Define the necessary ports
echo "🔍 Checking if required ports are available..."
REQUIRED_PORTS=("$FRONTEND_PORT" "$BACKEND_PORT" "$DATABASE_PORT" "$AUTH_PORT" "$MESSAGING_PORT")
for port in "${REQUIRED_PORTS[@]}"; do
  if lsof -i :$port > /dev/null 2>&1; then
    echo "❌ Port $port is already in use. Please free it before proceeding."
    exit 1
  fi
done
echo "✅ All required ports are available."

# Function to check if a command exists
command_exists() {
  command -v "$1" >/dev/null 2>&1
}

# Function to check if ports are free
check_ports() {
  local occupied_ports=()
  for port in "${PORTS[@]}"; do
    if lsof -i ":$port" >/dev/null 2>&1; then
      occupied_ports+=("$port")
    fi
  done

  if [ "${#occupied_ports[@]}" -gt 0 ]; then
    echo "❌ The following ports are in use: ${occupied_ports[*]}"
    echo "Please free these ports before proceeding."
    exit 1
  fi

  echo "✅ All required ports (${PORTS[*]}) are available."
}

# Function to load Docker images
# Function to download a file
download_file() {
  local url=$1
  local output=$2

  echo "📥 Downloading $output from $url..."
  curl -L -o "$output" "$url"

  if [ $? -ne 0 ]; then
    echo "❌ Failed to download $output from $url. Please check your internet connection or the URL."
    exit 1
  fi
  echo "✅ Successfully downloaded $output."
}

# Download all tar files
download_file "$FRONTEND_URL" "install_files/frontend.tar"
download_file "$BACKEND_URL" "install_files/backend.tar"
download_file "$DATABASE_URL" "install_files/database.tar"
download_file "$MESSAGING_URL" "install_files/messaging.tar"
download_file "$AUTH_URL" "install_files/auth.tar"


# Check if Docker is installed
if ! command_exists docker; then
  echo "❌ Docker is not installed. Please install Docker first."
  exit 1
fi
echo "✅ Docker is installed."

# Check if Docker Compose is installed
if ! command_exists docker-compose; then
  echo "❌ Docker Compose is not installed. Please install Docker Compose first."
  exit 1
fi
echo "✅ Docker Compose is installed."

# Check if required ports are free
check_ports

# Load Docker images
echo "🐳 Loading Docker images..."
docker load -i install_files/frontend.tar
docker load -i install_files/backend.tar
docker load -i install_files/database.tar
docker load -i install_files/messaging.tar
docker load -i install_files/auth.tar

# Start services using Docker Compose
echo "🐳 Starting Docker Compose services..."
docker-compose -f "docker_compose.yml" up -d || {
  echo "❌ Failed to start Docker Compose services."
  exit 1
}

# Completion message
echo "✅ Installation complete! Services are running."
echo "🌐 Frontend: http://localhost:${FRONTEND_PORT}"
echo "🛠️  Backend: http://localhost:${BACKEND_PORT}"
echo "📦 Database: Port ${DATABASE_PORT}"