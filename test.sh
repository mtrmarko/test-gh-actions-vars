# alias python3 as python
#sudo apt install python-is-python3

# install python2
#sudo apt install python2

# Install QEMU Guess Agent
sudo apt install qemu-guest-agent


# install node 17
sudo apt install curl
curl -fsSL https://deb.nodesource.com/setup_17.x | sudo -E bash -

#curl -fsSL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install -y nodejs

# install packages for native node package development
sudo apt-get install gcc g++ make

# run this to install pm2. It looks like it may install serve too so ignore next npm install serve line
npm install -g pm2
# probably do not need to run this
#npm install -g serve

# install yarn
curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor | sudo tee /usr/share/keyrings/yarnkey.gpg >/dev/null
echo "deb [signed-by=/usr/share/keyrings/yarnkey.gpg] https://dl.yarnpkg.com/debian stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install yarn

# install git
sudo apt install git

# install misc packages
sudo apt-get install ca-certificates curl gnupg lsb-release

# These are needed for Cypress integration testing
sudo apt install libgtk2.0-0 libgtk-3-0 libgbm-dev libnotify-dev libgconf-2-4 libnss3 libxss1 libasound2 libxtst6 xauth xvfb


# install docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo   "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io

# install docker compose (replace 2.2.2 with desired version)
sudo curl -L "https://github.com/docker/compose/releases/download/v2.2.2/docker-compose-linux-x86_64" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# create ~/projects directory and clone repos
mkdir ~/projects
cd ~/projects/
git clone https://github.com/NuclearnAI/frontend.git
git clone https://github.com/NuclearnAI/model-runtime-engine.git

# update .env file for model-runtime-engine
cd model-runtime-engine/
nano .env

# install python 3.8 virtual environments
sudo apt install python3.8-venv
sudo apt install python3-pip

# Need to be inside the MRE project/repo folder first
cd mre # go to mre subdir of repo before creating venv
python -m venv venv
. venv/bin/activate
# DO NOT run as root
pip install pip-tools
cd .. # go back to root of repo
pip-sync requirements.txt dev-requirements.txt
cd mre
make run


## Update setup.py to reuire python 3.8. Brad has it st 3.9

# start model runtime engine
make devenv

# install react-scripts and start frontend
cd ../frontend
yarn add react-scripts
yarn start
