s ← •Import "bqn-libs/strings.bqn"

data ← s.ToNums¨ •file.Lines "7_input.txt"

Eval ← {(𝕨+𝕩)⋈(𝕨×𝕩)}´⌽

Check ← { 
    goal‿nums ← (⊑⋈1⊸↓) 𝕩
    vs ← ⍷⥊ >⍟(≠𝕩) Eval nums
    #•Show goal‿nums‿vs‿(⊑goal ∊ vs)
    ⊑goal ∊ vs
}

Go ← { +´⊑¨Check¨⊸/ 𝕩 }

•Show Go data
