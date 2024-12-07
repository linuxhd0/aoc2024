data ← •file.Lines "3_input.txt"

s ← •Import "bqn-libs/strings.bqn"

nums ← "0123456789"

# Numbers ← { 
#    ne/˜∧´¨                          # keep those lists that begin and end with a number
#    (1⊸↑∾¯1⊸↑)⊸∊⟜nums¨               # find lists that begin and end with a number
#    ne ← (0⊸<∘≠¨/⊢)                  # find non empty lists
#    ∾ ")"⊸s.Split¨ "mul(" s.Split 𝕩  # split the data by "mul(" and ")" 
# }

Numbers ← { ne/˜∧´¨(1⊸↑∾¯1⊸↑)⊸∊⟜nums¨ ne←(0⊸<∘≠¨/⊢) ∾ ")"⊸s.Split¨ "mul(" s.Split 𝕩 }

# Happens to work on this data but would fail on "mul(123,123,123)".
                            
Mult ← {+´×´∘(•ParseFloat⎊0¨)¨ ','⊸s.Split¨ Numbers 𝕩}

•Show Mult ∾data

