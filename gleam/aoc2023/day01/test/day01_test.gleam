import gleeunit
import gleeunit/should
import day01

pub fn main() {
  gleeunit.main()
}

pub fn day01_test() {
  day01.part1("example")
  |> should.equal(Ok(142))

  day01.part1("input")
  |> should.equal(Ok(54_338))
}
