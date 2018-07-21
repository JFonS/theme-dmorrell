# DMorrell Fish Theme

This is a theme for 
    [fish](https://github.com/fish-shell/fish-shell)
that focuses on staying out of the way while giving helpful information,
in particular when working with Git.

![2018-07-22 00 48 23 screenshot](https://user-images.githubusercontent.com/4246780/43040637-45c207ee-8d49-11e8-9bd4-d6990a665487.png)

## Features

- Minimal base prompt.
- Indicates if previous command failed.
- Shows compact Git status with
    - the number of added, modified, and removed files, as well as the number of stashes; 
    - the type and name of the current revision; and
    - indication whether a merge or rebase is happening.
- Gives visual indication when you're logged in via SSH, or logged in as anyone
    but the default user. Shows a bright red "!" if you are logged in as root.

_Note:_ This theme is designed for a light-on-dark theme like 
    [Solarized](http://ethanschoonover.com/solarized) 
but should work in a dark-on-light terminal with a few terminal color tweaks.

## Installation

Install using
    [Oh My Fish](https://github.com/oh-my-fish/oh-my-fish):

```fish
omf install git@github.com:reitzig/theme-dmorrell.git
omf theme dmorrell
```

Set the list of default users by adding

```fish
set -g default_user "me" "buddy"
```

to your `.config/fish/config.fish`. 
Of course, this only makes sense if you use the same config across multiple accounts.
You can also add the same line to your own fork of the theme.

## Acknowledgements

 * Derived from Chris Morrell's
    [cmorrell](https://github.com/oh-my-fish/theme-cmorrell.com).
   Hence the name, because `d` comes after `c`.
 * Took some hints from Stefan Maric's
    [bigfish](https://github.com/stefanmaric/bigfish),
   in particular about smart glyph choices for representing Git status.
 * Grabbed some Git-related code from
    [git_util](https://github.com/fisherman/git_util).
