# Neovim Configuration
My Neovim configuration files for working with drupal. Is used by my [drupal](https://github.com/everynameistaken1/drupal) repository.

## *Prerequisites*
- [Linux, general/terminal knowledge](https://www.linux.org/forums/#linux-tutorials.122)
- [Neovim](https://neovim.io/doc/)

## Installation
Run one of the following commands in your terminal:

***SSH***
```
git clone git@github.com:everynameistaken1/nvim.git ~/.config/nvim
```

***HTTPS***
```
git clone https://github.com/everynameistaken1/nvim.git ~/.config/nvim
```

Start nvim and watch the plugin-manager install everything.

## *NOTE*
You need to have all the dependencies installed in order for all the plugins to work. All dependencies can be found [here](https://github.com/everynameistaken1/drupal/blob/main/drupal/.ci-dockerfile).

If your intent is to use this config with my [drupal](https://github.com/everynameistaken1/drupal) repository, there is no need to install this following the installation instructions above. This plugin comes bundled with [drupal](https://github.com/everynameistaken1/drupal), when targeting "xdebug-nvim" within the [.env](https://github.com/everynameistaken1/drupal/blob/main/.env) file.

The plugin *which-key* is installed. This allows you to see available mappings by simply pressing the spacebar once and waiting.
