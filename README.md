[![Forumla install test](https://github.com/AppliedLogicSystems/homebrew-als-prolog/actions/workflows/ci.yml/badge.svg)](https://github.com/AppliedLogicSystems/homebrew-als-prolog/actions/workflows/ci.yml)

# ALS-Prolog Homebrew/Linuxbrew Formula

A formula for installing [ALS Prolog](http://alsprolog.com) with the [Homebew](http://brew.sh)
or [Linuxbrew](https://github.com/Linuxbrew/linuxbrew) sudo-less package managers.

## Install

To tap and install the latest release:

`brew install AppliedLogicSystems/als-prolog/als-prolog`

## Using ALS Prolog

You can see the files installed with `brew ls als-prolog` (use `-v` for full list), but here are the highlights:

- `alspro` - command line prolog
- `alsdev` - GUI development environment
- `include/alspi.h` and `lib/libalspro.dylib` for build foreign predicates.

You can open the manual with:

`open /usr/local/share/doc/als-prolog/als-prolog-manual.pdf`

## Upgrading

To upgrade to the latest formula:

```
brew upgrade als-prolog
```

## Un-installing & Un-Tapping

`brew uninstall als-prolog`

`brew untap AppliedLogicSystems/als-prolog`

## Advanced Development

To install the latest unstable version from the master branch:

`brew install --HEAD als-prolog`
