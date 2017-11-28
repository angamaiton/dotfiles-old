# Kjartan Angamaiton's dotfiles

## Requirements

NOTE: These dotfiles are macOS-only. I also use Arch Linux and Ubuntu, but for
convenience's sake, I've chosen to split them into two separate repositories for
the time being.

Make sure you have zsh set as your login shell:

`chsh -s $(which zsh)`

## Installation

Clone onto your laptop:

`git clone git://github.com/angamaiton/dotfiles ~/dotfiles`

Install [rcm](https://github.com/thoughtbot/rcm):

```
brew tap thoughtbot/formulae
brew install rcm
```

Install the dotfiles:

`env RCRC=$HOME/dotfiles/rcrc rcup`

## Content

## Updating

In order to update, pull down the latest changes via `git` and run `rcup`.

## Customization

## License

env RCRC=$HOME/dotfiles/rcrc rcup
