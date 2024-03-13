import simplifile
import gleam/string.{is_empty, pop_grapheme, split, starts_with}
import gleam/list.{filter, first, last, map, reduce}
import gleam/result.{map_error, replace_error, try}
import gleam/int

pub const parts = [part1, part2]

pub fn part1(filepath) {
  calculate_solution(filepath, digit_patterns_part1)
}

pub fn part2(filepath) {
  let patterns = list.append(digit_patterns_part1, digit_patterns_part2)

  calculate_solution(filepath, patterns)
}

fn read_lines(filepath) {
  use content <- try(
    simplifile.read(filepath)
    |> map_error(fn(err) { "Failed to open file: " <> string.inspect(err) }),
  )

  let lines =
    content
    |> split("\n")
    |> filter(fn(line) { !is_empty(line) })

  Ok(lines)
}

fn calculate_solution(filepath, patterns) {
  use lines <- try(read_lines(filepath))

  let digits =
    lines
    |> map(find_digits(patterns, _))

  use numbers <- try(result.all(
    digits
    |> map(parse_number),
  ))

  numbers
  |> reduce(int.add)
  |> replace_error("Numbers list was empty!")
  |> result.map(int.to_string)
}

pub const digit_patterns_part1 = [
  #("1", 1),
  #("2", 2),
  #("3", 3),
  #("4", 4),
  #("5", 5),
  #("6", 6),
  #("7", 7),
  #("8", 8),
  #("9", 9),
]

pub const digit_patterns_part2 = [
  #("one", 1),
  #("two", 2),
  #("three", 3),
  #("four", 4),
  #("five", 5),
  #("six", 6),
  #("seven", 7),
  #("eight", 8),
  #("nine", 9),
]

pub fn find_digits(digit_patterns: List(#(String, Int)), line) -> List(Int) {
  use digits <-
    fn(then) {
      case pop_grapheme(line) {
        Ok(#(_, next_line)) -> then(find_digits(digit_patterns, next_line))
        _ -> []
      }
    }

  let match =
    digit_patterns
    |> list.find(fn(mapping) {
      line
      |> starts_with(mapping.0)
    })

  case match {
    Ok(#(_, digit)) -> [digit, ..digits]
    _ -> digits
  }
}

pub fn parse_number(digits) {
  use first <- try(
    first(digits)
    |> replace_error("No digits on line!"),
  )
  use last <- try(
    last(digits)
    |> replace_error("No digits on line!"),
  )

  let digits = [first, last]
  use number <- try(
    int.undigits(digits, 10)
    |> replace_error("Digits " <> string.inspect(digits) <> " are not base 10!"),
  )
  Ok(number)
}
