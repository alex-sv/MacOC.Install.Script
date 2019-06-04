#!/bin/sh

echo Install all AppStore Apps at first!
# If you are looking into a solution to automate AppStore installs,
# check mas https://github.com/argon/mas
# I installed XCode, Simplenote, Clocks, Stuffit Expander, Cloudapp, Forklift.
read -p "Press any key to continue... " -n1 -s
echo  '\n'


# Install Homebrew

# Check for Homebrew
if test ! $(which brew)
then
  echo "  Installing Homebrew for you."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" > /tmp/homebrew-install.log
fi

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade --all

# Add some casks
brew tap caskroom/cask
brew tap homebrew/dupes
brew services list

# Install important utilities
echo Install Core utilities
brew install coreutils
brew install ffmpeg
brew install imagemagick
brew install graphicsmagick
brew install httpie
brew install mc

# Crypto
#echo Install Crypto softwares
#brew install gpg keybase gpg-agent
#brew install tunnelblick

# Software
echo Install basic apps
brew cask install --appdir="/Applications" google-chrome
brew cask install --appdir="/Applications" firefox
brew cask install --appdir="/Applications" atom
brew cask install --appdir="/Applications" slack
brew cask install --appdir="/Applications" vlc
brew cask install --appdir="/Applications" adium
brew cask install --appdir="/Applications" nvalt
brew cask install --appdir="/Applications" flux
brew cask install --appdir="/Applications" alfred
brew cask install --appdir="/Applications" rescuetime
brew cask install --appdir="/Applications" gas-mask
brew cask install --appdir="/Applications" bitwarden
brew cask install --appdir="/Applications" progressive-downloader

# Development
echo Install Development tools
brew install nano
brew install git
brew install subversion

# Get a better shell
brew install zsh zsh-completions

# Development tools
brew install unison
brew install wget
brew install node
brew install yarn
brew install composer
brew install wp-cli

# Entertainment
echo Install some nice-to-have Entertainment tools
brew cask install --appdir="/Applications" transmission
brew cask install --appdir="/Applications" steam
brew cask install --appdir="/Applications" calibre
brew cask install --appdir="/Applications" handbrake


# Cleanup
brew cleanup
rem rm -f -r /Library/Caches/Homebrew/*

echo "All done! Phew!"
