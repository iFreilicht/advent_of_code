input ← &ru @\0 &fo "input"
parsed ← ⊜parse≠,@\n input
# Part 1
/+≡'>⍘⊟ ◫2 parsed
&p
# Part 2
/+≡'>⍘⊟ ◫2 ≡/+◫3 parsed
