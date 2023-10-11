f ← ∧(⎋∶+¬,⊙(≅⇡4⊛)) 4 ◫4 # Part 1 only
g ← ∧(⎋∶+¬,⊙(≅⇡⧻.⊛)) ⊙◫. # Generic solution

≡(⍤∶=, f ∩⊔⊃⊢'⊡1) &i "examples1.ua" # Test examples
≡(⍤∶=, g 4 ∩⊔⊃⊢'⊡1) &i "examples1.ua" # Test examples
≡(⍤∶=, g 14 ∩⊔⊃⊢'⊡1) &i "examples2.ua" # Test examples

# Part 1
g 4 &ru @\n &fo "input"
# Part 2
g 14 &ru @\n &fo "input"

∶dump∘
⍤"Wrong result for part 1!" =1779
⍤"Wrong result for part 1!" =2635
