Input  ← &ru @\0 &fo "input"
Parsed ← ⊜⋕ ≠@, .▽≠@\n .Input

# Part 1
⊃/↥/↧ .Parsed
⊙(⍤"Minimum is not 0!" =0)
⇡        # Get all potential target positions
≡⌟(/+⌵-) # Determine fuel spent if target position was selected
/↧       # Find the lowest one

# Part 2
⇡/↥ .Parsed
≡⌟(/+ ÷2×+1. ⌵-) # Naive alternative ∵(/++1⇡) is very slow
/↧

:dump∘
⍤"Wrong result for part 1!" =343441
⍤"Wrong result for part 2!" =98925151
