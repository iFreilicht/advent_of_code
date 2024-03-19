import gleeunit/should
import day03/day03

pub fn day03_test() {
  "src/day03/example"
  |> day03.part1
  |> should.equal(Ok("4361"))

  "src/day03/input"
  |> day03.part1
  |> should.equal(Ok("530495"))

  "src/day03/example"
  |> day03.part2
  |> should.equal(Ok("467835"))

  "src/day03/input"
  |> day03.part2
  |> should.equal(Ok("80253814"))
}
