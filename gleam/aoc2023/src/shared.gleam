import simplifile
import gleam/result.{map_error, try}
import gleam/string.{is_empty, split}
import gleam/list.{filter}

pub fn read_lines(filepath: String) -> Result(List(String), String) {
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
