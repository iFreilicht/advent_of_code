Input  ← &ru @\0 &fo "input"
Parsed ← ⊃(⊜⋕≠@,.°□⊢|↯∞_5_5≡(⊜⋕≠@ .°□)↘₁) ⊜□≠@\n. Input
Won    ← /+♭≥5⊟⊃/+(/+⍉)

⊙⟜(˜↯0△) Parsed                      # Put equally-sized array of 0s below board
[]                                   # Put container for "done" moves on top of the stack
⍢⊃(⊃(⊂⊙⊢)⋅↘₁⊙⊙∘|+⌕⊢⋅⊙⊙∘)(¬/+⋅⋅⋅≡Won) # Mark hit spaces until one board has won
⊃⋅⋅⊙∘⊣                               # Remove leftover instructions and get last-drawn number
∩⌞▽⊃⋅≡Won⊙∘                          # Keep the board that has won, including markers
/+♭×⊙¬                               # Sum all non-hit numbers
×                                    # Multiply with last-drawn number

dump∘
⍤$"Wrong result for part 1!" =5685
