strings ← •Import "bqn-libs/strings.bqn"

data ← strings.ToNums¨ •file.Lines "2_input.txt"

Order ← (∧´⊑⊸=)¨(×(-´˘2⊸↕))¨
Distance ← (∧´·(4⊸>∧0⊸<)·|∘-´˘2⊸↕)
Safe ← Order∧Distance¨

Safe data

