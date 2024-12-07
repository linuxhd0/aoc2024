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

# p = The previous group's value
# l = The last seen value
# c = The current value
# k = Whether or not we should keep this value

DoMask ← {
    p‿l‿k 𝕊 c: c = l ? 𝕨     ;
    p‿l‿k 𝕊 c: c < l ? l‿c‿0 ;
    p‿l‿k 𝕊 c:         l‿c‿1
}

DosAndDonts ← +`(("do()"⊸s.Locate)+(-"don't()"⊸s.Locate))

Masked ← {𝕩 /˜ ¯1⊑˘>(<0‿0‿1) DoMask` DosAndDonts 𝕩}

•Show Mult Masked ∾ data
