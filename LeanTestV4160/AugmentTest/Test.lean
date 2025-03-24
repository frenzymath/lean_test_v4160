import Mathlib

open ZMod

private lemma cube_of_castHom_ne_zero {n : ZMod 9} :
    castHom (show 3 ∣ 9 by norm_num) (ZMod 3) n ≠ 0 → n ^ 3 = 1 ∨ n ^ 3 = 8 := by
  revert n; decide

/-- If `a b c : ℤ` are such that `¬ 3 ∣ a * b * c`, then `a ^ 3 + b ^ 3 ≠ c ^ 3`. -/
lemma cube_of_not_dvd {n : ℤ} (h : ¬ 3 ∣ n) :
    (n : ZMod 9) ^ 3 = 1 ∨ (n : ZMod 9) ^ 3 = 8 := by
  apply cube_of_castHom_ne_zero
  rw [map_intCast, Ne, ZMod.intCast_zmod_eq_zero_iff_dvd]
  assumption

theorem intCast_zmod_eq_zero_iff_dvd (a : ℤ) (b : ℕ) : (a : ZMod b) = 0 ↔ (b : ℤ) ∣ a := by
  rw [← Int.cast_zero, ZMod.intCast_eq_intCast_iff, Int.modEq_zero_iff_dvd]

lemma cube_o2f_not_dvd1 {n : ℤ} (h : ¬3 ∣ n) : (n : ZMod 9) ^ 3 = 1 ∨ (n : ZMod 9) ^ 3 = 8 := by
  apply cube_of_castHom_ne_zero
  rw [map_intCast]
  rw [Ne]
  rw [ZMod.intCast_zmod_eq_zero_iff_dvd]
  assumption

open Int

lemma cube_o2f_not_dvd_with_have {n : ℤ} (h : ¬3 ∣ n) : (n : ZMod 9) ^ 3 = 1 ∨ (n : ZMod 9) ^ 3 = 8 := by
  apply cube_of_castHom_ne_zero
  have nonsense : 3 ∣ 9 := by
    norm_num
  rw [map_intCast]
  rw [Ne]
  have : (n : ZMod 3) = 0 ↔ (3 : ℤ) ∣ n := by
    rw [← Int.cast_zero]
    rw [intCast_eq_intCast_iff, modEq_zero_iff_dvd]
    simp
  rw [this]
  assumption
