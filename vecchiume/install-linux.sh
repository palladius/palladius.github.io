
# installing on ubuntu: https://jekyllrb.com/docs/installation/ubuntu/

# dice Jekuyll
sudo apt-get install ruby-full build-essential zlib1g-dev -y
# trovato io a caso con autocomplete
#sudo apt-get install  rubygems-integration -y
echo '# Install Ruby Gems to ~/gems' >> ~/.bashrc
echo 'export GEM_HOME="$HOME/gems"' >> ~/.bashrc
echo 'export PATH="$HOME/gems/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
#sudo gem install jekyll
gem install jekyll bundler


# ho visto che su ubuntu 20.04 di GCE jekyll ancora non c'e' ma consiglia di fare APT INSTALL JEWKYLL.
# ho pensato vatammazza e lho fatto vediamo che versione viene. crisbio 1min di installazione!

function schizofrenia() {
    sudo apt install jekyll -y
    # funge ma rende cose ambigue: lo tolgo
    sudo apt remove jekyll
}

# installa anche docker
install_docker_ubuntu2004() {
    sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
    #apt-cache policy docker-ce
    sudo apt install docker-ce -y
    sudo systemctl status docker

    # non root
    sudo usermod -aG docker ${USER}
}

gcloud compute --project=vulcanina firewall-rules create ricc-dflt-allow-jekyll-8080-e-4000 --description=allow\ jekyll:\ 4000\ \(stanrdard\)\ and\ 8080\ \(carlessiana\) --direction=INGRESS --priority=1000 --network=default --action=ALLOW --rules=tcp:4000,tcp:8080,tcp:8081 --source-ranges=0.0.0.0 --target-tags=enable-jekyll --enable-logging