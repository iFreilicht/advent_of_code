import gleam/result.{try}
import gleam/list
import gleam/string
import gleam/int
import shared.{read_lines}

pub const parts = [part1, part2]

type PartNumber {
  PartNumber(x: Int, start_y: Int, end_y: Int, content: String)
}

type Symbol {
  Symbol(x: Int, y: Int, content: String)
}

type Point {
  Point(x: Int, y: Int)
}

pub fn part1(filepath) {
  use lines <- try(read_lines(filepath))

  let #(max_x, max_y) = max_dimensions(lines)
  let #(part_numbers, symbols) = extract_contents(lines)

  let part_numbers =
    part_numbers
    |> list.filter(fn(pn) {
      let p1 = Point(int.max(pn.x - 1, 0), int.max(pn.start_y - 1, 0))
      let p2 = Point(int.min(pn.x + 1, max_x), int.min(pn.end_y + 1, max_y))

      symbols
      |> list.any(fn(symbol) {
        p1.x <= symbol.x
        && p1.y <= symbol.y
        && p2.x >= symbol.x
        && p2.y >= symbol.y
      })
    })

  part_numbers
  |> list.map(fn(pn) {
    let assert Ok(v) = int.parse(pn.content)
    v
  })
  |> list.fold(0, int.add)
  |> int.to_string
  |> Ok
}

pub fn part2(filepath) {
  use lines <- try(read_lines(filepath))

  let #(part_numbers, symbols) = extract_contents(lines)

  let gear_ratios =
    symbols
    |> list.filter_map(fn(symbol) {
      case symbol.content {
        "*" -> gear_ratio(symbol, part_numbers)
        _ -> Error(Nil)
      }
    })

  gear_ratios
  |> list.fold(0, int.add)
  |> int.to_string
  |> Ok
}

fn gear_ratio(symbol: Symbol, part_numbers: List(PartNumber)) {
  let adjacent_parts =
    part_numbers
    |> list.filter(fn(pn) { int.absolute_value(pn.x - symbol.x) <= 1 })
    |> list.filter(fn(pn) {
      int.absolute_value(pn.start_y - symbol.y) <= 1
      || int.absolute_value(pn.end_y - symbol.y) <= 1
    })

  case adjacent_parts {
    [part1, part2] -> {
      let assert Ok(n1) = int.parse(part1.content)
      let assert Ok(n2) = int.parse(part2.content)
      Ok(n1 * n2)
    }
    _ -> Error(Nil)
  }
}

fn max_dimensions(lines) {
  #(
    list.length(lines),
    list.length(
      lines
      |> list.first
      |> result.unwrap("")
      |> string.to_graphemes,
    ),
  )
}

fn extract_contents(lines) {
  lines
  |> list.index_fold(#([], []), fn(acc, line, x) {
    let #(part_numbers, symbols) =
      line
      |> string.to_graphemes
      |> list.index_fold(#([], []), fn(acc1, char, y) {
        let #(part_numbers, symbols) = acc1

        case char {
          "." -> acc1
          "0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9" -> #(
            case part_numbers {
              [PartNumber(x, start_y, end_y, content) as pn, ..rest] ->
                case end_y + 1 == y {
                  True -> [PartNumber(x, start_y, y, content <> char), ..rest]
                  False -> [PartNumber(x, y, y, char), pn, ..rest]
                }
              _ -> [PartNumber(x, y, y, char), ..part_numbers]
            },
            symbols,
          )
          _ -> #(part_numbers, [Symbol(x, y, char), ..symbols])
        }
      })

    #(list.concat([part_numbers, acc.0]), list.concat([symbols, acc.1]))
  })
}
