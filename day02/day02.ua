input ← &ru @\0 &fo "input"
# Map space index to [Forward Down/Aim]
map ← ⊡∶⬚0[0 0 0_¯1 0 0_1 0 0 1_0]
# Movements as [Magnitude SpaceIndex]
parsed ← ≡(×∶map⍘⊟) ⊜([⊗0≠@ ∶parse⊢⇌.])≠,@\n input

# Part1
parsed
/+ # Final position as [HorizontalPos Depth]
/×

# Part 2
# One step for the fold
# For two arrays [a b c] [d e], computes [a+d b+d*c c+e]
step ← |2 [⊃⊃(+⊙⋅⋅∘)(+⊙×⋅⊙⊙∘)(+⋅⋅⊙⋅∘)]/∘⇌⊂
parsed
∧step 0_0_0 # Final position as [HorizontalPos Depth Aim]
/×↙2

∶dump
⍤"Wrong result for part 1!" =2147104
⍤"Wrong result for part 2!" =2044620088
