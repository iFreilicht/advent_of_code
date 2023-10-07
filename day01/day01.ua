input ← &ru @\0 &fo "input"
parsed ← ⊜parse≠,@\n input
# Part 1
/+≡'>⍘⊟ ◫2 parsed

# Part 2
/+≡'>⍘⊟ ◫2 ≡/+◫3 parsed

∶dump
⍤"Wrong result for part 1!" =1446
⍤"Wrong result for part 2!" =1486
