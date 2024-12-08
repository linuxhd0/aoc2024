s ← •Import "bqn-libs/strings.bqn"

data ← s.ToNums¨ •file.Lines "7_input.txt"

Combine ← •Parsefloat∘∾○•Repr

Flatten ← {(∾𝕊¨)⍟(1<≡)⥊𝕩}

Eval ← {(𝕩+𝕨)⋈(𝕩×𝕨)⋈(Combine⚇0⟜𝕨 𝕩)}´⌽

Check ← { 
    goal‿nums ← (⊑⋈1⊸↓) 𝕩
    vs ← ⍷ Flatten Eval nums
    #•Show goal‿nums‿vs‿(⊑goal ∊ vs)
    ⊑goal ∊ vs
}

Go ← { +´⊑¨Check¨⊸/ 𝕩 }

•Show Go data
