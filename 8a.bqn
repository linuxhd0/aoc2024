data ← >•file.Lines "8_input.txt"

Antinodes ← {
    fc ← (𝕨=data) /○⥊ 𝕩  # frequency coordinates
    all_a ← ⥊(⊣+˘-⌜˜) fc # all antennas
    (¬∊⟜fc)⊸/ all_a
}

A ← {
    freqs ← (¬'.'⊸=)⊸/ ⍷⥊ 𝕩
    coords ← ↕≢𝕩
    +´+˝∨´{coords ∊ Antinodes⟜coords 𝕩}¨ freqs
}

•Show A data

