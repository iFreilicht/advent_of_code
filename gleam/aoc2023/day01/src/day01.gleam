import argv
import simplifile
import gleam/string.{is_empty, split, to_utf_codepoints, utf_codepoint_to_int}
import gleam/list.{filter, first, last, map, reduce}
import gleam/int
import gleam/io

pub fn main() {
  let assert [filepath] = argv.load().arguments
  let assert Ok(content) = simplifile.read(filepath)

  let assert Ok(result) =
    content
    |> split("\n")
    |> filter(fn(line) { !is_empty(line) })
    |> map(fn(line) {
      let digits =
        line
        |> to_utf_codepoints
        |> map(fn(codepoint) {
          codepoint
          |> utf_codepoint_to_int
          |> int.subtract(48)
        })
        |> filter(fn(x) { x >= 0 && x <= 9 })

      let assert Ok(first) = first(digits)
      let assert Ok(last) = last(digits)
      let assert Ok(number) = int.undigits([first, last], 10)
      number
    })
    |> reduce(int.add)

  result
  |> int.to_string
  |> io.println
}
