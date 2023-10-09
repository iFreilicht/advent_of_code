⊜□ ≠@\n . &ru @\0 &fo "input"

FindDups ← /↥⊞(×⊙=.)
Priority ← ◿58+1-@a

.
# Part 1
≡(
  ⊔
  ⍜(-@\0)(
    # Temporarily convert to numbers otherwise × won't work for filtering
    ⊃↙↘÷2⧻. # Split strings into two halves
    /↥FindDups # Find only duplicate
  )
  Priority
)
/+
∶

# Part 2
⊜∘+1⌊÷3⇡⧻. # Partition into groups of 3
≡(|1 ⍜(-@\0)(|1
    /⊔
    ▽±.⊝FindDups
    /↥FindDups
  ))
Priority
/+

∶dump∘
⍤"Wrong result for part 1!" =8298
⍤"Wrong result for part 2!" =2708
