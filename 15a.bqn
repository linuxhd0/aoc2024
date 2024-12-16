⟨Move⟩ ⇐
data ← •file.Lines "15_input.txt"

Parse ← {
  map‿·‿moves ← (+`·»⊸+⟨⟩⊸≡¨)⊸⊔ 𝕩
  (>map)‿(∾moves)
}

map‿moves ← Parse data

Ahead ← {
  '<' 𝕊 m: +`˘⌾(⌽˘)'@'=m;
  'v' 𝕊 m: +`      '@'=m;
  '>' 𝕊 m: +`˘     '@'=m;
  '^' 𝕊 m: +`⌾⌽    '@'=m
}

ComplexMove ← {
  𝕊 view:
    s ← view ⊑∘⊐ '.'
    w ← view ⊑∘⊐ '#'
    (s<w)◶⟨⊢, (1⊸⌽⁼)⌾((s+1)⊸↑)⟩ view
}

Move ⇐ {
  𝕊 view:
    {⊑1 ⊐˜ ⟨"@#", "@."⟩ ≡⟜(2⊸↑)¨ 𝕩}◶⟨view, {⌽⌾(2⊸↑) view}, ComplexMove∘⊑⟩ <view
}

Go ← {
  dir 𝕊 map:
    view_mask ← ⥊  dir Ahead map
    dmap ← ⥊ map
    view ← view_mask / dmap
    new_view ← (⊑∘∊⟜"<^")◶⟨{Move view}, {Move⌾⌽view}⟩ dir
    new_map ← new_view⌾(view_mask⊸/) dmap
    (≢map)⥊new_map
}

•Show +´⥊100‿1⊸×˘>(('O'⊸=)/○⥊(↕∘≢)) Go´ (⌽moves) ∾ <map

