//// The solution runner.
//// Example:
//// gleam run 1 1 example

import argv
import gleam/string.{pad_left}
import gleam/list.{key_find}
import gleam/result.{replace_error, try}
import gleam/io
import day01/day01
import day02/day02

pub fn main() {
  case run_solution() {
    Ok(result) -> {
      io.println(result)
      Ok(Nil)
    }
    Error(err) -> {
      io.println_error(err)
      Error(Nil)
    }
  }
}

const days = [#("1", day01.parts), #("2", day02.parts)]

fn run_solution() {
  use #(day, part, filepath) <- try(get_args())

  use day_parts <- try(
    key_find(days, day)
    |> replace_error("Invalid <day>! " <> usage),
  )

  use part <- try(get_part(part, day_parts))

  let filepath = "src/day" <> pad_left(day, 2, "0") <> "/" <> filepath
  part(filepath)
}

fn get_part(part, day_parts: List(fn(String) -> Result(any, String))) {
  case part {
    "1" -> list.at(day_parts, 0)
    "2" -> list.at(day_parts, 1)
    _ -> Error(Nil)
  }
  |> replace_error("<part> " <> part <> " is invalid or missing! " <> usage)
}

const usage = "Usage: gleam run <day> <part> <file>"

fn get_args() {
  case argv.load().arguments {
    [day, part, filepath] -> Ok(#(day, part, filepath))
    _ -> Error("Incorrect number of arguments! " <> usage)
  }
}
