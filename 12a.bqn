data ← >•file.Lines "12_input.txt"

dir ← «‿»‿(«˘)‿(»˘)
shifts ← dir {𝕎𝕩}¨ <data
fences   ← +´(<data) ≠¨ shifts
coords ← ↕≢data
plant_types ← ⍷⥊ data
Utr ← <⌜˜↕  # upper triangular matrix
C ← {(𝕨 = data) /○⥊ 𝕩}

Distances ← {
  # Distances between all coordinates for each type of plant
  (Utr∘⊑∘≢)⊸× {1=√+´×˜(𝕨-𝕩)}⌜˜ 𝕩
}

ConnectDistances ← {
  # Create lists of related coordinates
  plant_coords S plant_matrix:
   plant_coords {<(≍𝕨)∾(𝕩/plant_coords)}˘ plant_matrix
}

# ops = grouping operations to perform on connected coordinates
Group ← { ops ← ⍷∨´∘∊⌜˜ 𝕩 ⋄ (<𝕩) {<⍷∾𝕩/>𝕨}˘ ops }

Perimeter ← {(+´·+˝fences×coords⊸∊)¨𝕩}¨

Area ← {≠¨𝕩}¨

coords_by_type ← C⟜coords¨ plant_types

groups ← (Group⍟{⌊2⋆⁼≠} ConnectDistances⟜Distances)¨ coords_by_type

•Show +´∾(Area × Perimeter) groups

