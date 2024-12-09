data ← ⊑•file.Lines "9_input.txt"

expand    ← (⊢/↕∘≠) 1+data-'0' # add 1 because I want to group later
spaces    ← 2|expand
numbers   ← ¬spaces
mask      ← +`»⊸<spaces  # mask numbers and following spaces
num_grp   ← 1↓¨ mask ⊔˜ (mask × numbers) - spaces  # 1↓ to remove that 1+ above
space_grp ← 1↓¨ mask ⊔˜ (mask × spaces) - numbers
m         ← space_grp ⌈○≠ num_grp
l         ← space_grp ⌊○(≠∘∾) num_grp
fills     ← (∾space_grp) ⊔○(l⊸↑) ⌽∾num_grp  # reverse the numbers and place in space groups

•Show +´×˝(⊢≍(↕∘≠))(≠∾num_grp)↑∾⥊⍉ fills ≍○(m⊸↑) num_grp

