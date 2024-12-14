s         ← •Import "bqn-libs/strings.bqn"
data      ← s.ToNums¨ •file.Lines "14_input.txt"
robots    ← 2‿2⊸⥊∘⌽˘>data
dmz‿space ← (⌊∘÷⟜2⋈⊢) 103‿101
seconds   ← 100
# quads: ⟨⟨51⊸< 50⊸<⟩ ⟨51⊸< 50⊸>⟩ ⟨51⊸> 50⊸<⟩ ⟨51⊸> 50⊸>⟩⟩
quads     ← dmz⊸{𝕨{𝕨⊸𝕩}¨𝕩}¨ (<‿<)‿(<‿>)‿(>‿<)‿(>‿>)
CheckDMZ  ← {𝕨{F‿G 𝕊 x‿y: ∧´(F x)‿(G y) }¨𝕩}
Move      ← {np ← space|+˝ 𝕩 ⋄ np⌾(1⊸⊏) 𝕩}˘

final_pos     ← Move⍟seconds robots
still_hostlie ← ({∧´dmz≠1⊏𝕩}˘)⊸/ final_pos

•Show ×´+˝{quads CheckDMZ⟜<1⊏𝕩}˘ still_hostlie

