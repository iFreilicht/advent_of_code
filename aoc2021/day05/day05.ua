Input ← &ru @\0 &fo "input"
⊜□ ≠@\n .Input # Separate lines
≡(⊏0_2 ⊜□ ≠@ .⊔)
∵(⊜parse ≠@, .⊔)

+1⍥/↥3. # Get maximum possible edge-length of board
↯[.] ⊙(0) # Create board with that size
∶

# Check whether angles of lines match my assumptions
.
≡/÷≡/-
[⊃⊃⊃⊃(=∞)(=¯∞)(=1)(=¯1)(=0)]
≡/+⍉
⍤"Expected all lines to be horizontal, vertical or 45° diagonal" =/+∶⧻.

# Uncomment for Part 1
# ▽≡(/+/=). # Keep only vertical and horizontal lines

∧(
  ⍜⍉(
    ⊢⇌⊏⍏⌵.≡/-. # Find the x or y length of this line, whichever is greater
    ≡(□+⊙/↧?⇌∘=¯1±∶⇡+1⌵./-.)∶ # Create a range from the start to the end for both axes
    ∺(↯[+1⌵]⊙⊔)∶ # Extend and merge as one axis could have a length of just 1
  )∶
  ∧(⍜(⊡)(+1)∶)∶ # Increment all points the line crosses
)∶
⍉
/+♭>1 # Count all points crossed more than once

dump∘
⍤"Wrong result for part 2!" =20299
