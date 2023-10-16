⊜∵parse ≠@\n . &ru @\0 &fo "input"

.
# Part 1
⊙(
  ⊃⊃⊃∘≡⇌'⇌⍉'⍉⇌ # Create four version of the board, each with a different border to the left
  ∩∩≡(
    ∧(⊂⊙⊃>↥) [] ¯1 # Create mask of visible trees
    ⊙; # Discard height of highest tree
  )
  ⊓⊓⊓∘≡⇌'⍉⇌'⇌⍉ # Rotate boards back
  ↥∩↥ # Overlap the boards
  /+/+ # Count all visible trees
)

⊃⊃⊃∘≡⇌'⇌⍉'⍉⇌ # Create four version of the board, each with a different border to the left
∩∩≡(
  ⇡⧻.
  ⍚0_∞(
    ↘ # Only consider trees to the "right"
    ∺≥ ⊃⊢'↘1 # Mark trees blocking the view
    +1⊚. # Get distance to those trees
    ⊙⧻ # Get distance to edge
    ⊢⊂ # Take distance to tree if there is one blocking the view, otherwise to the edge
  )
)
⊓⊓⊓∘≡⇌'⍉⇌'⇌⍉ # Rotate boards back
×∩× # Multiply scores for all directions
/↥/↥ # Get highest score of all trees

∶dump∘
⍤"Wrong result for part 1!" =1798
⍤"Wrong result for part 2!" =259308
