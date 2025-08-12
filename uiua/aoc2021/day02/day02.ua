Input ← &ru @\0 &fo "input"
# Movements as list of up/down moves and list of forward moves 
Parsed ← ∩⌟× - ∩₃⌟=@u@d@f ⊜⊃⊢(⋕⊣) ⊸≠@\n Input

# Part1
× ∩/+ Parsed

# Part 2 (Aim, Depth, Forward)
× ◌ ∧⊃(+⊙⋅∘|+×⋅⊙⊙∘|+⋅⊙⋅⋅∘) Parsed 0 0 0

:dump∘
⍤"Wrong result for part 1!" =2147104
⍤"Wrong result for part 2!" =2044620088
