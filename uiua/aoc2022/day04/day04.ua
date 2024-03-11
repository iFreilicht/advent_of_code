&ru @\0 &fo "input"
⊜(⊜(⊜parse ≠@- .) ≠@, .) ≠@\n .
Parsed ←
# Get the ranges defined for both elves on the stack
GetRanges ← (|1.2 /(|1 +⊃(⇡+1-)∘/∘⇌))

# Part 1
/+≡(|1
  GetRanges
  ⌕?⊙∘∶ >∩⧻ ,, # Search for the smaller one in the bigger one
  /+ # That returned an array; reduce to scalar
) Parsed

# Part 2
/+≡(|1
  GetRanges
  /↥/+⊞(=)
) Parsed

∶dump∘
⍤"Wrong result for part 1!" =413
⍤"Wrong result for part 2!" =806
