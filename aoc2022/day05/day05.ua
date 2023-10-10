Parsed ← (
  &ru @\0 &fo "input"

  ⊜□ ¬⊂0⌕"\n\n" . # Split start state from instructions
  ∩⊔⊃⊢'⊡1 # Put both on the stack
  # Parse start state
  ⊜∘ ≠@\n .
  ▽=0◿4-1⇡⧻.⍉ # Filter out whitespace and bracket columns
  ≡⍜⇌(□▽≠@ .↘1) # Remove unnecessary "index" and whitespace

  # Parse instructions
  ⊙(⊜(∵'parse⊔ ▽◿2⇡6 ⊜□ ≠@ .) ≠@\n .) # Split lines and remove verbs
)

# Part 1
Parsed
⊙(
  ⊃⊢(⍉↘1) ⍉ # Separate repetitions from start and end index
  ▽ # Repeat each instruction as required
  -1 # Normalize indices to 0
)
∧(
  ∶
  ⊃'⊡1⊢ # Unpack array
  ⊙⍜⊡⍜⊔⊃'↘1⊢ # Remove top crate from its stack
  ⍜⊡⍜⊔'⊂∶ # Put it on the target stack
)
≡⊢

Parsed
⊙⍜(↘1⍉)'-1 # Normalize indices to 0
∧(
  ∶
  ⊃⊃⊃'⊡2'⊡1⋅∘⊢ # Unpack and arrange arguments
  ⊙⍜⊡⍜⊔'⊃↘↙∶ # Remove top n crates from stack
  ⍜⊡⍜⊔'⊂∶ # Put them on the target stack
)
≡⊢

∶dump∘
⍤"Wrong result for part 1!" ≅"QGTHFZBHV"
⍤"Wrong result for part 2!" ≅"MGDMPSZTM"
