ns ← •Import "15a.bqn"

Test ← {
  𝕊 f‿t‿r:
  result ← F t
  •Show t‿"→"‿r‿result‿(⊢◶⟨"❌", "✅"⟩ result≡r)
}

Test ns.move‿"@...."‿".@..."
Test ns.move‿"@.#.."‿".@#.."
Test ns.move‿"@.O.."‿".@O.."
Test ns.move‿"@#..."‿"@#..."
Test ns.move‿"@OO..#"‿".@OO.#"
Test ns.move‿"@O#..#"‿"@O#..#"
Test ns.move‿"@OO#.#"‿"@OO#.#"
Test ns.move‿"@O.O.#"‿".@OO.#"
Test ns.move‿"@OO.O#"‿".@OOO#"
Test ns.move‿"@OO.OO#"‿".@OOOO#"
Test ns.move‿"@OO#OO#"‿"@OO#OO#"
Test ns.move‿"@OO#O.O#"‿"@OO#O.O#"
Test ns.move‿"@O.O#O.O#"‿".@OO#O.O#"

