f ← ∧⋄~(⎋∶+¬,⊙(≍⇡4⊛)) 4 ◫4 # Part 1 only
g ← ∧⋄~(⎋∶+¬,⊙(≍⇡⧻.⊛)) ⊙◫. # Generic solution
Example ← &i "examples.ua"

≡(⍤∶=, f ∩⊔⊃⊢'⊡1) Example "One" # Test examples
≡(⍤∶=, g 4 ∩⊔⊃⊢'⊡1) Example "One" # Test examples
≡(⍤∶=, g 14 ∩⊔⊃⊢'⊡1) Example "Two" # Test examples

# Part 1
g 4 &ru @\n &fo "input"
# Part 2
g 14 &ru @\n &fo "input"

∶dump∘
⍤"Wrong result for part 1!" =1779
⍤"Wrong result for part 1!" =2635
