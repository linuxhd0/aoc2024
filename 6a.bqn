data ← >•file.Lines "6_input.txt"

# The idea is that I rotate the matrix such that the forward direction 
# is always to the right

Done ← ⊑((-⟜1)∘≠=⊐⟜'^')

Ahead ← { 
 map_list ← <˘𝕩 
 pi       ← ∨´∘('^'⊸=)¨ map_list                    # player index 
 or       ← ⊑ pi / map_list                         # original row
 fp       ← (⊐⟜'^') or                              # from player
 bo       ← (≠or)⌊fp+(fp↓or)⊐'#'                    # before obstacle
 nr       ← ({(=⟜'.')◶⟨⊢,'○'⟩¨⌽}⌾(fp⊸↓))⌾(bo⊸↑) or  # new row
 # •Show or‿nr 
 (¬Done nr)⋈>nr⌾((⊑pi⊐1)⊸⊑) map_list
}

Orient ← ⌽˘⍉

Turn ← ⌽⍉

Go ← { 
    𝕊 map: 
        1⊑{𝕊 not_done‿map: Ahead Turn map}•_while_{𝕊 not_done‿map: not_done} Ahead Orient map 
}

•Show 1++´'○'=⥊Go data

