# Advent of Code in Gleamtown

To run a single solution:

```sh
# gleam run <day> <part> <file>
$ gleam run    1    1    example
```

The filepath is relative to the day's directory. In the example above,
the solution would be caluclated for `src/day01/example`.

To run all solutions, and check if they compute the correct answer:

```sh
gleam test
```