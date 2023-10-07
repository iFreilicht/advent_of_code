input ← &ru @\0 &fo "input"
parsed ← ⊜∵parse ≠@\n .input

# Part 1
parsed
≥÷2⧻∶/+. # 0 if there's more 0s, 1 otherwise
×∩⍘⋯¬.⇌

# Part 2
# Oxygen generator rating
stepOx ← (
  ∶ # Put the index on top
  ⊙'⍉.
  ⊡
  ≥÷2⧻∶/+.. # 0 if there's more 0s, 1 otherwise
  =
  +×1≅[0]. # If the mask is [0], make it [1]
  ▽
)
parsed
⇡⧻⍉.
∧stepOx ∶
⍘⋯⇌♭

stepCo ← (
  ∶ # Put the index on top
  ⊙'⍉.
  ⊡
  <÷2⧻∶/+.. # 0 if there's fewer 0s, 1 otherwise
  =
  +×1≅[0]. # If the mask is [0], make it [1]
  ▽
)
parsed
⇡⧻⍉.
∧(stepCo) ∶
⍘⋯⇌♭

# Now multiply both results
×

∶dump
⍤"Wrong result for part 1!" =2640986
⍤"Wrong result for part 2!" =6822109
