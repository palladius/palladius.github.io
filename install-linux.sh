
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
