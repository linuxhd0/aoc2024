s ← •Import "bqn-libs/strings.bqn"

data ← •file.Lines "5_input.txt"

Parse ← {s.ToNums¨ ((∨´𝕨⊸=)⎊0¨)⊸/ 𝕩}

rdata ← '|' Parse data

udata ← ',' Parse data

UpdateRules ← {rs 𝕊 u: (∧´¨+˝>(rdata⊸=)¨ u) / rs}

CheckRule ← {rs 𝕊 u: ∧´1>-´¨ u⊸⊐¨rs}

ValidUpdates ← {rs 𝕊 updates: ur ← rs⊸UpdateRules¨ updates ⋄ ur CheckRule¨ updates}

A ← {+´ {⌊∘÷⟜2∘≠⊸⊑𝕩}¨ (𝕨 ValidUpdates 𝕩)/𝕩}

•Show rdata A udata

