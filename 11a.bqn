s     ← •Import "bqn-libs/strings.bqn"
data  ← s.ToNums ⊑•file.Lines "11_input.txt"
Split ← { •ParseFloat¨ (2÷˜≠)⊸(↑⋈↓) •Repr 𝕩 }
Rules ← { 0: 1; 𝕩: 0=2|≠•Repr𝕩 ? Split 𝕩; 𝕩×2024 }
Blink ← { ∾ Rules¨ 𝕩 }

•Show ≠Blink⍟25 data
