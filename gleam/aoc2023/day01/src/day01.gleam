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

pub fn solution() {
  use filepath <- try(case argv.load().arguments {
    [filepath] -> Ok(filepath)
    _ -> Error("Usage: gleam run <file>")
  })

  use content <- try(
    simplifile.read(filepath)
    |> map_error(fn(err) { "Failed to open file: " <> string.inspect(err) }),
  )

  let lines =
    content
    |> split("\n")
    |> filter(fn(line) { !is_empty(line) })

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
