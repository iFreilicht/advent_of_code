import gleeunit/should
import day02/day02

pub fn day02_test() {
  "src/day02/example"
  |> day02.part1
  |> should.equal(Ok("8"))

  "src/day02/input"
  |> day02.part1
  |> should.equal(Ok("2149"))
}
