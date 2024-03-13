import gleam/result.{try}
import gleam/list
import gleam/string
import gleam/int
import shared.{read_lines}

pub const parts = [part1]

const part1_max = [#("red", 12), #("green", 13), #("blue", 14)]

pub fn part1(filepath) {
  use lines <- try(read_lines(filepath))

  lines
  |> list.filter_map(fn(line) {
    let assert [id, game] = string.split(line, ": ")

    let assert Ok(id) =
      id
      |> string.split(" ")
      |> list.last

    let is_valid =
      game
      |> string.split("; ")
      |> list.all(fn(move) {
        move
        |> string.split(", ")
        |> list.all(fn(move) {
          let assert [amount, color] = string.split(move, " ")
          let assert Ok(amount) = int.parse(amount)
          let assert Ok(max) = list.key_find(part1_max, color)
          amount <= max
        })
      })

    case is_valid {
      True -> int.parse(id)
      False -> Error(Nil)
    }
  })
  |> list.reduce(int.add)
  |> result.map(int.to_string)
  |> result.replace_error("Output list was empty!")
}
