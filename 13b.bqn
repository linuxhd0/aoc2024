s ← •Import "bqn-libs/strings.bqn"
m ← •Import "bqn-libs/matrix.bqn"

data ← •file.Lines "13_input.txt"
mats ← ⍉¨∘‿2⊸⥊∘∾¨(3⊸/·↕·÷⟜3≠)⊸⊔ s.ToNums¨ (⟨⟩⊸≢¨)⊸/ data
solved ← {
  m1‿m2 ← ((¯1⊸↓˘)⋈¯1⊸↑˘) 𝕩
  m1 m.Solve (10000000000000 + m2)
}¨ mats
Round ← { (0.99<⌈-⊢)◶⟨(0.99<⊢-⌊)◶⟨⊢, ⌈⟩, ⌊⟩⚇0 𝕩}
_Is ← {∾∧˝¨𝔽𝕩}
Int ← ⌊⊸=

•Show +´⥊>(2‿1⥊3‿1)⊸×¨ Int _Is⊸/ Round solved

