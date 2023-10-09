&ru @\0 &fo "input"
⊜(⊜⊢ ≠@ .) ≠@\n .
Parsed ←

# Part 1
CalcScore ← /+ ≡(
  ⍘⊟
  ⊙.
  ◿3+1- # This returns 0 for loss, 1 for draw and 2 for win
  ×3
  ⊙(-@@) # 1 for Rock, 2 for paper, 3 for scisssors. @ is one less than A
  +
)
Parsed
≡(⍜'⊡1'-23) # Normalize @X to @A
CalcScore

# Part 2
Parsed
≡(
  ⊙(-@Y)⍘⊟ # 0 for draw, -1 for lose, 1 for win
  [⊙⍜'-@A(◿3+).]
)
CalcScore

∶dump∘
⍤"Wrong result for part 1!" =13005
⍤"Wrong result for part 2!" =11373
