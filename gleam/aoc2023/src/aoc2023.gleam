//// The solution runner.
//// Example:
//// gleam run 1 1 example

import argv
import simplifile
import gleam/string.{pad_left}
import gleam/list.{key_find}
import gleam/result.{replace_error, try}
import gleam/io
import day01/day01
import day02/day02

pub fn main() {
  case run() {
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

type Args {
  RunSolution(day: String, part: String, filepath: String)
  AddNewDay(day: String)
}

fn run() {
  use args <- try(get_args())

  case args {
    RunSolution(day, part, filepath) -> run_solution(day, part, filepath)
    AddNewDay(day) -> add_new_day(day)
  }
}

fn run_solution(day, part, filepath) {
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
    [day, part, filepath] -> Ok(RunSolution(day, part, filepath))
    ["new", day] -> Ok(AddNewDay(day))
    _ -> Error("Incorrect number of arguments! " <> usage)
  }
}

fn add_new_day(day) {
  let day = string.pad_left(day, 2, "0")

  let base = "src/day" <> day
  use _ <- try_fs(CopyDir, from: "src/template", to: base)
  io.println("Created " <> base)

  let target = base <> "/day" <> day <> ".gleam"
  use _ <- try_fs(RenameFile, from: base <> "/day__", to: target)
  io.println("Created " <> target)

  let target = "test/day" <> day <> "_test.gleam"
  use _ <- try_fs(CopyFile, from: "test/template", to: target)
  io.println("Created " <> target)

  let assert Ok(content) = simplifile.read(target)
  let content = string.replace(content, each: "__", with: day)
  let assert Ok(_) = simplifile.write(content, to: target)

  Ok("Done!")
}

type FsOperation {
  CopyDir
  CopyFile
  RenameFile
}

fn try_fs(do operation: FsOperation, from source, to target, then callback) {
  let execute = case operation {
    CopyDir -> simplifile.copy_directory
    CopyFile -> simplifile.copy_file
    RenameFile -> simplifile.rename_file
  }

  let err_preamble =
    "Failed to "
    <> string.inspect(operation)
    <> " from "
    <> source
    <> " to "
    <> target
    <> ": "

  use _ <- try(case simplifile.file_info(target) {
    Ok(_) -> Error(err_preamble <> "Target already exists.")
    Error(_) -> Ok(Nil)
  })

  use out <- try(
    execute(source, target)
    |> result.map_error(fn(err) { err_preamble <> string.inspect(err) }),
  )

  callback(out)
}
