# Advent of Code in Gleamtown

## Run a single solution

```sh
cd aoc2023
# gleam run <day> <part> <file>
$ gleam run    1    1    example
```

The filepath is relative to the day's directory. In the example above,
the solution would be caluclated for `src/day01/example`.

## Run all solutions

Each day also has a test file that checks against the output I verified
on [adventofcode.com](https://adventofcode.com). To run all tests:

```sh
gleam test
```

## Create a new solution

To quickly create scaffolding for new solutions, run:

```sh
# gleam run new <day>
$ gleam run new   3
```

I could've used [`gladvent`](https://hexdocs.pm/gladvent/) but wanted to
play around with working with files, so I re-implemented it.
