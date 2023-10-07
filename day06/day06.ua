input ← &ru @\0 &fo "input"
parsed ← ⊜parse ×⊃'≠@,'≠@\n .input

# Part 1
# Naive implementation, just have an array with one element per fish
stepOne ← ⊂+×7<0.-1∶[⍥(8)]/+=0.
⍥(stepOne)80 parsed
⧻
.

# Part 2
# Use structure that stores the number of fish per internal timer
stepTwo ← ⍜'⊡6+∶⊡8.↻1
convert ← ∺(/+⌕)⇡9
⍥(stepTwo)80 convert parsed
/+
⍤"Efficient solution should yield same result as naive one!" =

⍥(stepTwo)256 convert parsed
/+

∶dump
⍤"Wrong result for part 1!" =386755
⍤"Wrong result for part 2!" =1732731810807
