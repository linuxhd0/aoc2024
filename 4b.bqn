data ← >•file.Lines "4_input.txt"

AllAidxs ← (0‿0⊸≢¨)⊸(/○⥊ )('A'⊸=×↕∘≢)

Unreachable ← {∧´¨¬(𝕨⊸=+0⊸=) 𝕩}

Aidxs ← {((1-˜⊑≢𝕩)⊸Unreachable)⊸/ AllAidxs 𝕩} 

MSidxs ← ⟨¯1‿¯1, 1‿¯1, 1‿1, ¯1‿1⟩⊸+⟜<¨ Aidxs

Count ← {+´+˝⟨"MMSS", "MSSM", "SSMM", "SMMS"⟩ ≡⌜ ⊑⟜𝕩⎊"   "¨ MSidxs 𝕩}

