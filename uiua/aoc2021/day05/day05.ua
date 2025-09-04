Input  ← &ru @\0 &fo "input"
Parsed ← ⊜(↯2_2[∩∩⋕ °$"_,_ -> _,_"]) ≠@\n .Input
Zeroed ← ×₀°△+₁[.] /↥♭ # Build zeroed board to work with
ListCoords ← (
  °⊟⍉                          # Get start and stop coordinates per axis
  ∩(˜⨬⇌∘ +⇡⤚- ⊃(/↧|+₁/↥|>⊃⊢⊣)) # Create range start to end coordinate per axis
  ⍣(°[∘].|:⊙(°[∘].)|0∘)        # Get value of unchanging axis, default to 0 for diagonal lines
  □⍉⬚∘⊟                        # Create range of all coordinates in that line
)
PaintLine     ← ⬚0+ ⍉°⊚°□ # Overlay a coordinate list on top of a board
CountOverlaps ← /+/+∧≥2

Parsed
∩⌟▽ ⟜¬≡(/+/=) . # Split list of lines into straights and diagonals
⟜Zeroed
# Part 1 (Straights only)
≡ListCoords
∧PaintLine
⊃˜⊙∘CountOverlaps # Get result and reorder stack for part 2

# Part 2 (Diagonals only, reusing intermediate result from Part 1 for improved performance)
≡ListCoords
∧PaintLine
CountOverlaps

:dump∘
⍤"Wrong result for part 2!" =5608
⍤"Wrong result for part 2!" =20299
