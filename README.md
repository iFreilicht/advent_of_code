# Advent of Code in Uiualand

These are all my Advent of Code solutions, written in [Uiua](https://www.uiua.org/).

It is a work-in-progress.

## Setup

This repository uses [direnv](https://direnv.net/) and the [Nix Package Manager](https://nixos.org/) to ensure
solutions are reproducible. Install direnv and Nix, enable the Nix features `flakes` and `nix-command`,
and run `direnv allow` to compile the version I used when authoring whatever commit you're on.

If you check out a different commit and the version of Uiua changed in between,
direnv will use Nix to recompile Uiua so the outdated code will run like it
did in the past. All builds run directly against the [official Uiua repo](https://github.com/uiua-lang/uiua).

You can of course just install Uiua any other way you please, but as Uiua is still developing quickly
and I often build solutions against unreleased versions, the code may not run as intended, if at all.

## Upgrading Uiua / Testing new versions

To upgrade Uiua, run `nix flake lock --update-input uiua` to pull and compile the latest version of Uiua
from the main branch. Run `./run_all.sh` afterwards to ensure all solutions are still working.

*Note to self:* Commit all changed files afterwards to ensure formatter changes are tracked properly.