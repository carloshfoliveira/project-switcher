# Project Switcher 2 for Atom Text Editor

[![Build Status](https://travis-ci.org/chocoelho/project-switcher2.svg?branch=master)](https://travis-ci.org/chocoelho/project-switcher2)
[![Plugin installs!](https://img.shields.io/apm/dm/project-switcher2.svg)](https://atom.io/packages/project-switcher2)
[![Package version!](https://img.shields.io/apm/v/project-switcher2.svg?style=flat)](https://atom.io/packages/project-switcher2)
[![License!](https://img.shields.io/apm/l/project-switcher2.svg?style=flat)](https://atom.io/packages/project-switcher2)


Switch between sibling projects in the same folder using the same opened window!

## Usage

Just press `cmd-;`(if you're in a Mac machine) or `ctrl-;` for Linux/Windows users.
Some users have the cedilla key (`ç`) in their keyboard, this key's in the place where
`;` is in US keyboards. Users that have `ç` in their keyboard can use both
`ctrl-ç` and `ctrl-;`.

![A screencast of project-switcher2 package](http://i.imgur.com/dl4eic7.gif)

## FEATURES

* Change between sibling projects in the same folder **AND/OR** projects inside Project Home variable
* Set projects paths to switch between when you don't want to mess with Project Home editor variable
* Automatically close opened panes when switching between projects (Settings)
* Open in desired project in another window (Settings)
* Works with multiple folders
  * Project Tree
    * It doesn't recover previous state if you switch back
  * Project Home
    * Project Home editor paths separated by comma
  * Projects Paths
    * Custom projects paths separated by comma, so you don't mess with the core Project Home option

## TODO

* Recover project workspace
