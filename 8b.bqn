data ← >•file.Lines "8_input.txt"

Antinodes ← {
  fa 𝕊 coords:                 # frequency antennas
    fc        ← fa /○⥊ coords  # frequency coordinates
    d         ← -⌜˜fc
    ha        ← fc+˘d          # harmonic antennas
    harmonics ← (<ha) + (<d)×↕⌈´≢coords
    (coords ∊○⥊ >harmonics)  / ⥊ coords
}

A ← {
  freqs ← (¬'.'⊸=)⊸/ ⍷⥊ 𝕩
  coords ← ↕≢𝕩
  +´+˝∨´ 𝕩⊸{coords ∊ (𝕨=𝕩) Antinodes⟜coords 𝕩}¨ freqs
}

•Show A data

