# Install QEMU Guess Agent
sudo apt install qemu-guest-agent


# install node 17
sudo apt install curl
curl -fsSL https://deb.nodesource.com/setup_17.x | sudo -E bash -

#curl -fsSL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install -y nodejs

# install packages for native node package development
sudo apt-get install -y gcc g++ make

# run this to install pm2. It looks like it may install serve too so ignore next npm install serve line
sudo npm install -g pm2

# install yarn
curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor | sudo tee /usr/share/keyrings/yarnkey.gpg >/dev/null
echo "deb [signed-by=/usr/share/keyrings/yarnkey.gpg] https://dl.yarnpkg.com/debian stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install -y yarn

# install git
sudo apt install -y git

# install misc packages
sudo apt-get install -y ca-certificates curl gnupg lsb-release

# These are needed for Cypress integration testing
sudo apt install -y libgtk2.0-0 libgtk-3-0 libgbm-dev libnotify-dev libgconf-2-4 libnss3 libxss1 libasound2 libxtst6 xauth xvfb


# install docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo   "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

# install docker compose (replace 2.2.2 with desired version)
sudo curl -L "https://github.com/docker/compose/releases/download/v2.2.2/docker-compose-linux-x86_64" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# install python 3.8 virtual environments
sudo apt update
sudo apt install software-properties-common -y
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt install python3.9 python3.9-venv -y

# Enable Git credential store and store and set default user info
git config --global credential.helper store
git config --global user.email "marko@nuclearn.ai"
git config --global user.name "Marko Mitrovic"
