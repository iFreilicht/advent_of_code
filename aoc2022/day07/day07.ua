x ← □""

# Turn the list of commands and outputs into a list of directories and their sizes
[] # Array for finished directories (fin array)
[] # Stack of directories we're currently in (dir stack)
⬚⊜(⊜□ ≠@ .)x ≠@\n . &ru @\0 &fo "input"
∧~⋄⋄(|3.2
  ≠0⧻⊡2. # Is there a third element? (only the case for `cd`)
  ?(
    ≍".."⊔⊡2 # Is the directory ".."?
    ?(
      ⊃'↘1'⊂⊢ # Move top directory from dir stack to fin array
    )'⊂0 # Put the directory size on top of the dir stack
  )(
    ±.⍣(parse⊔⊡0)(0;;) # Does the current line start with a number?
    ?(≑⋄~+); # If so, add it to all directories on the dir stack
  )
)
⊏⍏.⊂ # Turn the two separate lists into one, sorted by size
.

# Part 1
⊙(∧~⋄+ ∶0▽≡(≤ⁿ5 10).) # Add sizes of all directories smaller than 100k

# Part 2
- ×4 ⁿ7 10 ⊢⇌. # How much space do I need to free?
⊡⊢⊚>⊙. # How big is the smallest directory that frees enough space?

∶dump∘
⍤"Wrong result for part 1!" =1141028
⍤"Wrong result for part 2!" =8278005
