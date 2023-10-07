Input ← &ru @\0 &fo "input"
Parsed ← ⊜parse≠,@\n Input
# Part 1
/+≡'>⍘⊟ ◫2 Parsed

# Part 2
/+≡'>⍘⊟ ◫2 ≡/+◫3 Parsed

∶dump∘
⍤"Wrong result for part 1!" =1446
⍤"Wrong result for part 2!" =1486
