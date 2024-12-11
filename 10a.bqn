data       ← '0'-˜>•file.Lines "10_input.txt"
zeros      ← (≢data)⥊((⊒⊸+⟜1)×(0⊸=))⥊ data
starts     ← >(<={1+↕⌈´⥊𝕩}) zeros
directions ← «‿(»˘)‿»‿(«˘)
ToCheck    ← {∨´directions {𝕎˘𝕩}¨ <𝕩}
plan       ← (1+⌽↕9)∾<starts
Walk       ← { to 𝕊 from: to = data⊸×˘ ToCheck from }

•Show +´⥊Walk´ plan
