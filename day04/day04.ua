Input ← &ru @\0 &fo "input"
Part ← 2 # Set to 2 to solve Part2

⊢⊙'↘1 . ⊜□ ≠@\n .Input # Split input into instructions and boards
# Parse instructions
⊜parse ≠@, .⊔
⍤"Assumed input had no number twice!" =∩⧻⊝. .
# Parse boards
∵(⊜(parse) ≠@ .⊔)∶ # Now they're in one big array with shape [5*n 5]
↯[⊙(.⊡1)÷/∘.△]. # Find n and reshape to [n 5 5]
# Increment both by 1 so we can use negative sign as a marker
∩'+1
⊙(.)
≡[0 □] # Keep track of how many turns each board needs to win
∺∧(|2
  ∶/∘ # Unpack counter and board
  [
    # Create the array for the next iteration
    ⊙(
      ∶⊔
      ¬×2⌕ ⊙. # Create mask that is -1 where the number was found, else 1
      × # Apply that mask
      □
    )
    +1
  ]
  ±¬±⊔⊡1. # Make mask that is 1 wherever negative values are on the board
  ≡(/×). # Check if any rows have only 1 in them
  ≡(/×)⍉∶ # Check if any columns have only 1 in them
  /↥⊂ # OR all of those
  ⎋
)

∵⊔⍘⊟⍉ # Turn result into two arrays containing the board and number of turns each

/(↧↥ ≠2Part). # Get lowest (part1) or highest (part2) number of turns required

⊙(⊡⊗). # Get the winning board
⊙(⊡-1)∶ # Get the final drawn number
∩'-1 # Undo incrementing shennenigans from before
×¬±¬±. # Only keep positive numbers
/+♭ # Sum them all
× # Multiply for final result

dump∘
⍤$"Wrong result for part _!" Part =5685
