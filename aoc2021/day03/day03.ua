Input ← &ru @\0 &fo "input"
Parsed ← ⊜∵parse ≠@\n .Input

# Part 1
Parsed
≥÷2⧻∶/+. # 0 if there's more 0s, 1 otherwise
×∩⍘⋯¬.⇌

# Part 2
# Oxygen generator rating
StepOx ← (
  ⊙'⍉.
  ⊡
  ≥÷2⧻∶/+.. # 0 if there's more 0s, 1 otherwise
  =
  +×1≍[0]. # If the mask is [0], make it [1]
  ▽
)
Parsed
⇡⧻⍉.
∧~⋄StepOx
⍘⋯⇌♭

StepCo ← (
  ⊙'⍉.
  ⊡
  <÷2⧻∶/+.. # 0 if there's fewer 0s, 1 otherwise
  =
  +×1≍[0]. # If the mask is [0], make it [1]
  ▽
)
Parsed
⇡⧻⍉.
∧~⋄StepCo
⍘⋯⇌♭

# Now multiply both results
×

∶dump∘
⍤"Wrong result for part 1!" =2640986
⍤"Wrong result for part 2!" =6822109
