data ← >•file.Lines "6_input.txt"

# The idea is that I rotate the matrix such that the forward direction 
# is always to the right

Done ← ⊑((-⟜1)∘≠=⊐⟜'^')

Ahead ← { 
 ml ← <˘𝕩                                     # map as a list
 pi ← ∨´∘('^'⊸=)¨ ml                          # player index 
 or ← ⊑ pi / ml                               # original row
 fp ← (⊐⟜'^') or                              # from player
 bo ← (≠or)⌊fp+(fp↓or)⊐'#'                    # before obstacle
 nr ← ({(=⟜'.')◶⟨⊢,'○'⟩¨⌽}⌾(fp⊸↓))⌾(bo⊸↑) or  # new row
 # •Show or‿nr 
 (¬Done nr)⋈>nr⌾((⊑pi⊐1)⊸⊑) ml
}

# Clockwise / Counterclockwise
CW‿CCW ← (⌽˘⍉)‿(⌽⍉)

Go ← { 
    𝕊 map: 
        1⊑{𝕊 not_done‿map: Ahead CCW map}•_while_{𝕊 not_done‿map: not_done} Ahead CW map 
}

•Show 1++´'○'=⥊Go data

