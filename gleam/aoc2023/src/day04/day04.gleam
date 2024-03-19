import gleam/result.{try}
import gleam/list
import gleam/string
import gleam/int
import gleam/float
import shared.{read_lines}

pub const parts = [part1, part2]

pub fn part1(filepath) {
  use lines <- try(read_lines(filepath))

  lines
  |> list.filter_map(fn(line) {
    let assert Ok(line) =
      line
      |> string.split(":")
      |> list.last

    let assert [winning_numbers, your_numbers] =
      line
      |> string.split("|")
      |> list.map(fn(str) {
        str
        |> string.trim
        |> string.split(" ")
        |> list.filter(fn(s) { !string.is_empty(s) })
      })

    let wins: Int =
      your_numbers
      |> list.filter(fn(num) {
        winning_numbers
        |> list.contains(num)
      })
      |> list.length

    case wins {
      0 -> Ok(0.0)
      x ->
        x - 1
        |> int.to_float
        |> int.power(2, _)
    }
  })
  |> list.map(float.round)
  |> list.fold(0, int.add)
  |> int.to_string
  |> Ok
}

pub fn part2(filepath) {
  use lines <- try(read_lines(filepath))
  todo
}
