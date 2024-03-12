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

  day01.replace_words_with_digits("eightwoa3oneight", "")
  |> should.equal("8woa31ight")

  day01.part2("example2")
  |> should.equal(Ok(281))

  // This answer is incorrect
  day01.part2("input")
  |> should.equal(Ok(53_407))
}
