data ← >•file.Lines "4_input.txt"

Count ← {+´⥊∾"XMAS"⊸⍷¨ 𝕩}

Id ← =⌜˜↕

Masks ← {1↓⍉¨⊸∾ »⍟(↕1+𝕩-4) Id 𝕩}

DiagMasks ← {(/○⥊)⟜𝕩¨ Masks ≠𝕩}

Straights ← {<˘∾𝕩‿(⌽˘𝕩)‿(⍉𝕩)‿(⌽˘⍉𝕩)} 

Diags ← {(⌽¨⊸∾)∾(DiagMasks 𝕩)‿(DiagMasks ⌽˘𝕩)}

•Show Diags⊸(+○Count)⟜Straights data

