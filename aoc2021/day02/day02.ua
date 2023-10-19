Input ← &ru @\0 &fo "input"
# Map space index to [Forward Down/Aim]
Map ← ⊡∶⬚[0 0 0_¯1 0 0_1 0 0 1_0]0
# Movements as [Magnitude SpaceIndex]
Parsed ← ≡(×∶Map⍘⊟) ⊜([⊗0≠@ ∶parse⊢⇌.])≠,@\n Input

# Part1
Parsed
/+ # Final position as [HorizontalPos Depth]
/×

# Part 2
# One step for the fold
# For two arrays [a b c] [d e], computes [a+d b+d*c c+e]
Step ← |2 [⊃⊃(+⊙⋅⋅∘)(+⊙×⋅⊙⊙∘)(+⋅⋅⊙⋅∘)]/∘⇌⊂
Parsed
∧⋄~ Step 0_0_0 # Final position as [HorizontalPos Depth Aim]
/×↙2

∶dump∘
⍤"Wrong result for part 1!" =2147104
⍤"Wrong result for part 2!" =2044620088
