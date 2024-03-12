import argv
import simplifile
import gleam/string.{is_empty, split, to_utf_codepoints, utf_codepoint_to_int}
import gleam/list.{filter, first, last, map, reduce}
import gleam/result.{map_error, replace_error, try}
import gleam/int
import gleam/io

pub fn main() {
  case solution() {
    Ok(result) -> {
      result
      |> int.to_string
      |> io.println
      Ok(Nil)
    }
    Error(err) -> {
      io.println_error(err)
      Error(Nil)
    }
  }
}

fn solution() {
  use filepath <- try(get_args())

  part1(filepath)
}

fn get_args() {
  case argv.load().arguments {
    [filepath] -> Ok(filepath)
    _ -> Error("Usage: gleam run <file>")
  }
}

pub fn part1(filepath) {
  read_lines(filepath)
  |> try(calculate_solution)
}

pub fn part2(filepath) {
  use lines <- try(read_lines(filepath))
  lines
  |> map(replace_words_with_digits(_, ""))
  |> calculate_solution
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

const replacement_values = [
  #("one", "1"),
  #("two", "2"),
  #("three", "3"),
  #("four", "4"),
  #("five", "5"),
  #("six", "6"),
  #("seven", "7"),
  #("eight", "8"),
  #("nine", "9"),
]

pub fn replace_words_with_digits(leftover_line, transformed_line) -> String {
  use line <-
    fn(then) {
      case string.length(leftover_line) {
        0 -> transformed_line
        _ -> then(leftover_line)
      }
    }

  let match =
    replacement_values
    |> list.find(fn(mapping) {
      line
      |> string.starts_with(mapping.0)
    })

  case match {
    Ok(#(word, numeral)) -> {
      let assert Ok(#(_word, rest_of_line)) =
        string.split_once(leftover_line, on: word)

      replace_words_with_digits(rest_of_line, transformed_line <> numeral)
    }
    _ -> {
      let assert Ok(#(head, tail)) = string.pop_grapheme(leftover_line)
      replace_words_with_digits(tail, transformed_line <> head)
    }
  }
}

fn calculate_solution(lines) {
  use numbers <- try(result.all(
    lines
    |> map(fn(line) {
      line
      |> to_utf_codepoints
      |> map(fn(codepoint) {
        codepoint
        |> utf_codepoint_to_int
        |> int.subtract(48)
      })
      |> filter(fn(x) { x >= 0 && x <= 9 })
      |> parse_number
    }),
  ))

  numbers
  |> reduce(int.add)
  |> replace_error("Numbers list was empty!")
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
