# xpt [![CircleCI](https://circleci.com/gh/denisidoro/xpt.svg?style=svg)](https://circleci.com/gh/denisidoro/xpt) ![GitHub release (latest by date including pre-releases)](https://img.shields.io/github/v/release/denisidoro/xpt?include_prereleases)

**xpt** is an abstraction over whatever package managers you have installed in your system. No need to run different commands based on the distro you're running anymore!

:warning: Due to the unpopularity of this repo, the development of the package manager will be continued together with [my dotfiles](https://github.com/denisidoro/dotfiles/tree/master/scripts/package).

Let's say you want to install [ag](https://github.com/ggreer/the_silver_searcher). This is the required procedure:
```sh
# if you're on OSX
brew install the_silver_searcher

# if you're on Ubuntu
apt-get install silversearcher-ag

# if you're on Fedora
yum install the_silver_searcher
```

Fortunately, `xpt install ag` will do the trick!

Table of contents
-----------------

   * [Installation](#installation)
      * [Using Homebrew or Linuxbrew](#using-homebrew-or-linuxbrew)
      * [Using git](#using-git)
   * [Upgrading](#upgrading)
   * [Usage](#usage)
      * [Installing packages](#installing-packages)
      * [More options](#more-options)
   * [Recipes](#recipes)
      * [Using your own custom recipes](#using-your-own-custom-recipes)
      * [Submitting recipes](#submitting-recipes)
   * [Etymology](#etymology)

Installation
------------

### Using Homebrew or Linuxbrew

You can use [Homebrew](http://brew.sh/) or [Linuxbrew](http://linuxbrew.sh/)
to install **xpt**:
```sh
brew install denisidoro/tools/xpt
```

### Using git

Alternatively, you can `git clone` this repository:

```sh
git clone --depth 1 https://github.com/denisidoro/xpt /opt/xpt
cd /opt/xpt

# In case you want to add the xpt command to your $PATH
sudo make install

# In case you want to add the xpt command to an arbitrary folder
./scripts/install /some/folder
```

Upgrading
---------

**xpt** is being actively developed and you might want to upgrade it once in a while. Please follow the instruction below depending on the installation method used:

- brew: `brew update; brew reinstall xpt`
- git: `cd /opt/xpt && sudo make update`

Usage
-----

### Installing packages

`xpt install <packages>...`

### More options

Please refer to `xpt --help` for more details.

Recipes
-----------

**xpt** can install software based on custom recipes. This allows you to add a custom behavior to a install script or to add a fallback in case no compatible package manager was found. 

Please refer to [the examples](https://github.com/denisidoro/xpt/tree/master/src/recipes) in order to help you write recipes. 

### Using your own custom recipes

In this case, you need to pass a `:`-separated list of separated directories which contain `.cheat` files:
```sh
xpt --path "/folder/with/cheats"
```

Alternatively, you can set an environment variable in your `.bashrc`-like file:
```sh
export XPT_PATH="/folder/with/cheats:/another/folder"
```

### Submitting recipes

Feel free to fork this project and open a PR for me to include your contributions.

Etymology
---------

In [Mass Effect](https://masseffect.fandom.com/wiki/Mass_Effect_Wiki), [Expat](https://masseffect.fandom.com/wiki/Expat) is a merchant from the [Citadel](https://masseffect.fandom.com/wiki/Citadel), center of communication between the various races that inhabit the galaxy.


In addition, **xpt** is similar to [apt](https://en.wikipedia.org/wiki/Advanced_Packaging_Tool).
