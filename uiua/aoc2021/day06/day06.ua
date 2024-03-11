Input ← &ru @\0 &fo "input"
Parsed ← ⊜parse ×⊃'≠@,'≠@\n .Input

# Part 1
# Naive implementation, just have an array with one element per fish
StepOne ← ⊂+×7<0.-1∶[⍥(8)]/+=0.
⍥(StepOne)80 Parsed
⧻
.

# Part 2
# Use structure that stores the number of fish per internal timer
StepTwo ← ⍜'⊡6+∶⊡8.↻1
Convert ← ≑~⋄(/+⌕)⇡9
⍥(StepTwo)80 Convert Parsed
/+
⍤"Efficient solution should yield same result as naive one!" =

⍥(StepTwo)256 Convert Parsed
/+

∶dump∘
⍤"Wrong result for part 1!" =386755
⍤"Wrong result for part 2!" =1732731810807
