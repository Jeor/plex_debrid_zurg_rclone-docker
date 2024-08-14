# Update & Install Docker
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add Docker repository 
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

# Install prereqs
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Create mounted directories
sudo mkdir -p /mnt/zurg

echo "Enter Real Debrid API Token (https://real-debrid.com/apitoken): "
read API_KEY
sed -i "s/yourtoken/$API_KEY/g" config.yml

echo "Enter Plex Claim Token (https://www.plex.tv/claim/): "
read PLEX_TOKEN
sed -i "s/#claimtoken/$PLEX_TOKEN/g" docker-compose.yml

docker compose up  --detach

echo "Follow Plex setup instructions to add library. Press enter to continue."
read NULL

docker attach plex_debrid
