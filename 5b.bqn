s ← •Import "bqn-libs/strings.bqn"

data ← •file.Lines "5_input.txt"

Parse ← {s.ToNums¨ ((∨´𝕨⊸=)⎊0¨)⊸/ 𝕩}

rdata ← '|' Parse data

udata ← ',' Parse data

UpdateRules ← {rs 𝕊 u: (∧´¨+˝>(rdata⊸=)¨ u) / rs}

CheckRule ← {rs 𝕊 u: ∧´1>-´¨ u⊸⊐¨rs}

ValidUpdates ← {rs 𝕊 updates: ur ← rs⊸UpdateRules¨ updates ⋄ ur CheckRule¨ updates}

Count ← {+´ {⌊∘÷⟜2∘≠⊸⊑𝕩}¨ 𝕩}

Del ← {(𝕨⊸↑∾(𝕨+1)⊸↓) 𝕩}

Ins ← {v‿i 𝕊 𝕩: (i↑𝕩)∾v∾(i↓𝕩)}

# Left > Right

LGR ← { 𝕊 l‿r‿li‿ri‿ls: (=⟜≠⟜ls)◶⟨ l‿(ri) Ins li Del ls ⋄ l ∾ ls ⟩ li }

# Left < Right

LLR ← { 𝕊 l‿r‿li‿ri‿ls: (=⟜≠⟜ls)◶⟨ls ⋄ ls ∾ r ⟩ ri }

Apply ← { 
    l‿r 𝕊 ls : 
        li ← ⊑ls ⊐ l 
        ri ← ⊑ls ⊐ r 
        ×◶⟨ 
            (l‿r∾ls) 
            LGR l‿r‿li‿ri‿ls 
            LLR l‿r‿li‿ri‿ls 
        ⟩ li-ri 
}

B ← {Count 𝕨 {𝕩 {(≢⟜𝕨)◶⟨𝕨, 𝕊⟜𝕩⟩ 𝕨 Apply´ 𝕩}¨ 𝕨⊸UpdateRules¨𝕩} (¬𝕨 ValidUpdates 𝕩)/𝕩}

•Show rdata B udata

