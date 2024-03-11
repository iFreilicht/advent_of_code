# Advent of Code

These are all my Advent of Code solutions, written in whatever languages I am interested in.

I'll probably never finish all of them, but that's alright.

## Setup

This repository uses [direnv](https://direnv.net/) and the [Nix Package Manager](https://nixos.org/) to ensure
solutions are reproducible. Install direnv and Nix and enable the Nix features `flakes` and `nix-command`.

Each language has its own directory, containing a flake that locks the exact version of the language I
ran or compiled each solution with.

Go to one of those directories and run `direnv allow` to compile or download all tools required for
running the solutions.

