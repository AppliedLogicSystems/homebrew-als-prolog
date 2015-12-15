# ALS-Prolog Homebrew Formula

## Setup

To allow Homebrew to access the formula, it must be told to 'tap' into the repository:

`brew tap AppliedLogicSystems/als-prolog`

## Install & Upgrading

The formula is currently setup as a HEAD formula, so it always builds from the leading edge of the Git repo.
Thus the `--HEAD` argument is always required.

`brew install --HEAD als-prolog`

To upgrade to the latest formula and Git commit, first update, then reinstall:

```
brew update
brew reinstall als-prolog
```

## Using ALS Prolog

You can see the files installed with `brew ls als-prolog` (use `-v` for full list), but here are the highlights:

- `alspro` - command line prolog
- `alsdev` - GUI development environment
- `include/alspi.h` and `lib/libalspro.dylib` for build foreign predicates.

You can open the manual with:

`open /usr/local/share/doc/als-prolog/als-prolog-manual.pdf`

## Un-installing & Un-Tapping

`brew uninstall als-prolog`

`brew untap AppliedLogicSystems/als-prolog`
