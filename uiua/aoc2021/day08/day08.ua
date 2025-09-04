Input ← &ru @\0 &fo "input"
# Segments that are lit to display each number
Letters ← {
  "abcefg"  # 0
  "cf"      # 1
  "acdeg"   # 2 
  "acdfg"   # 3
  "bcdf"    # 4
  "abdfg"   # 5
  "abdefg"  # 6
  "acf"     # 7
  "abcdefg" # 8
  "abcdfg"  # 9
}
ToMask ← ∧(+⌕) °□ ⟜(¤"abcdefg" ×0⇡7)
Parsed ← ⊜(∩(⊜ToMask ≠@ .) °$"_ | _") ≠@\n .Input

# Part 1
≡₁(/+) ◌Parsed
≡ToMask Letters
≡(/+⊡) 1_4_7_8 ¤ # Get number of segments lit for each number
/+/+∧(+⌕)? ⊃(∘|⋅¤|0)

dump∘
⍤"Wrong result for part 1!" =554
