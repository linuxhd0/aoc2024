data ← •file.Lines "1_input.txt"

Split ← ((⊢-˜+`×¬)∘=⊔⊢)

Pair ← •ParseFloat¨ ·> (1⊸↑∾¯1⊸↑)∘(' '⊸Split)¨

•Show +´|∘-˝∧˘⍉  Pair data

