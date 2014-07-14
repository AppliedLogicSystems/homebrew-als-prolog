# ALS-Prolog Homebrew Formula

## Setup

To allow Homebrew to access the formula, it must be told to 'tap' into the repository:

`brew tap chuckhoupt/als-prolog`

## Install & Updating

The formula is currently setup as a HEAD formula, so it always builds from the leading edge of the SVN trunk. Thus the `--HEAD` argument is always required.

`brew install --HEAD als-prolog`

To Update to the latest SVN commit, reinstall:

`brew reinstall --HEAD als-prolog`

## Un-installing & Un-Tapping

`brew uninstall als-prolog`

`brew untap chuckhoupt/als-prolog`
