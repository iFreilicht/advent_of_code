import gleeunit/should
import gleam/list
import day01/day01

pub fn day01_test() {
  "src/day01/example"
  |> day01.part1
  |> should.equal(Ok("142"))

  "src/day01/input"
  |> day01.part1
  |> should.equal(Ok("54_338"))

  list.append(day01.digit_patterns_part1, day01.digit_patterns_part2)
  |> day01.find_digits("eightwoa3oneight")
  |> should.equal([8, 2, 3, 1, 8])

  "src/day01/example2"
  |> day01.part2
  |> should.equal(Ok("281"))

  "src/day01/input"
  |> day01.part2
  |> should.equal(Ok("53_389"))
}
