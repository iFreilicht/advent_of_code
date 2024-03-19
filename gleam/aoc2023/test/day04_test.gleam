import gleeunit/should
import day04/day04

pub fn day04_test() {
  "src/day04/example"
  |> day04.part1
  |> should.equal(Ok("13"))

  "src/day04/input"
  |> day04.part1
  |> should.equal(Ok("22488"))

  "src/day04/example"
  |> day04.part2
  |> should.equal(Ok(todo))

  "src/day04/input"
  |> day04.part2
  |> should.equal(Ok(todo))
}
