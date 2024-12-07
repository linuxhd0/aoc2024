data ← •file.Lines "1_input.txt"

Split ← ((⊢-˜+`×¬)∘=⊔⊢)

Pair ← •ParseFloat¨ ·> (1⊸↑∾¯1⊸↑)∘(' '⊸Split)¨

paired ← Pair data

hash ← (⊑˘ •HashMap ¯1⊸⊑˘) >(⊑⋈≠)¨ (⊐⊸⊔)1⊏˘ paired

•Show +´ hash.Has◶⟨0,⊣×hash.Get⟩¨ ⊑˘ paired
