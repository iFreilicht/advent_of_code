import gleeunit
import gleeunit/should
import gleam/list
import day01

pub fn main() {
  gleeunit.main()
}

pub fn day01_test() {
  day01.part1("example")
  |> should.equal(Ok(142))

  day01.part1("input_long")
  |> should.equal(Ok(54_338))

  let patterns =
    list.append(day01.digit_patterns_part1, day01.digit_patterns_part2)
  day01.find_digits(patterns, "eightwoa3oneight")
  |> should.equal([8, 2, 3, 1, 8])

  day01.part2("example2")
  |> should.equal(Ok(281))

  // This answer is incorrect
  day01.part2("input_long")
  |> should.equal(Ok(53_389))
}
