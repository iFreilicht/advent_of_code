Input  ← &ru @\0 &fo "input"
Parsed ← ⊃(⊜⋕≠@,.°□⊢|↯∞_5_5≡(⊜⋕≠@ .°□)↘₁) ⊜□≠@\n. Input
Prepare ← (
  ⊙⟜(˜↯0△) # Put equally-sized array of 0s below board
  []       # Put container for "done" moves on top of the stack
)
Won  ← ±/+♭≥5⊟⊃/+(/+⍉)
Mark ← ⊃(⊃(⊂⊙⊢)⋅↘₁⊙⊙∘|+⌕⊢⋅⊙⊙∘)
Finalize ← (
  ⊃⋅⋅⊙∘⊣      # Remove leftover instructions and get last-drawn number
  ∩⌞▽⊃⋅≡Won⊙∘ # Keep the board that has won, including markers
  /+♭×⊙¬      # Sum all non-hit numbers
  ×           # Multiply with last-drawn number
)

# Part 1
Prepare Parsed
# Mark hit spaces until one board has won
⍢Mark(¬/+ ⋅⋅⋅≡Won)
Finalize

# Part 2
Prepare Parsed
# Remove winning boards, then mark hit spaces until only one board is left
⍢(Mark ⊙⊙(∩⌞▽¬ ⊃⋅≡Won⊙∘))(¬≍[1] ⋅⋅⋅≡Won)
Finalize

:dump∘
⍤$"Wrong result for part 1!" =5685
⍤$"Wrong result for part 2!" =21070
