/-
Copyright (c) 2026 Juan Pablo Traverso Gianini. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Juan Pablo Traverso Gianini
-/
module

public import Mathlib
public import LeanPool.BeckFialaMatrix

/-!
# Proofs of the statements in `Challenge.lean`

Both theorems come from `LeanPool/BeckFialaMatrix/Basic.lean`: the floating-coordinates argument
(keep the sums of tight rows fixed along a nonzero kernel direction until a coordinate reaches a
boundary, and induct on the number of floating coordinates).
-/

@[expose] public section

open Finset

namespace BeckFiala

/-- **Beck–Fiala integer-making theorem.** If every column of the `0/1` matrix `A` has at most
`t ≥ 1` ones and `x ∈ [0,1]^N`, then `x` can be rounded to `y ∈ {0,1}^N` with
`|∑ᵢ A j i (y i - x i)| < t` for every row `j`. -/
theorem exists_rounding {m N t : ℕ} (ht : 1 ≤ t)
    (A : Fin m → Fin N → ℤ)
    (hA : ∀ j i, A j i = 0 ∨ A j i = 1)
    (hdeg : ∀ i, (Finset.univ.filter (fun j => A j i = 1)).card ≤ t)
    (x : Fin N → ℚ) (hx : ∀ i, 0 ≤ x i ∧ x i ≤ 1) :
    ∃ y : Fin N → ℤ, (∀ i, y i = 0 ∨ y i = 1) ∧
      ∀ j, |∑ i, (A j i : ℚ) * ((y i : ℚ) - x i)| < (t : ℚ) :=
  BeckFialaMatrix.exists_rounding ht A hA hdeg x hx

/-- **Beck–Fiala, strengthened.** The rounding can moreover be chosen to keep every coordinate of
`x` that is not strictly between `0` and `1`. -/
theorem exists_rounding_preserving_integral {m N t : ℕ} (ht : 1 ≤ t)
    (A : Fin m → Fin N → ℤ)
    (hA : ∀ j i, A j i = 0 ∨ A j i = 1)
    (hdeg : ∀ i, (Finset.univ.filter (fun j => A j i = 1)).card ≤ t)
    (x : Fin N → ℚ) (hx : ∀ i, 0 ≤ x i ∧ x i ≤ 1) :
    ∃ y : Fin N → ℤ, (∀ i, y i = 0 ∨ y i = 1) ∧
      (∀ i, ¬ (0 < x i ∧ x i < 1) → (y i : ℚ) = x i) ∧
      ∀ j, |∑ i, (A j i : ℚ) * ((y i : ℚ) - x i)| < (t : ℚ) := by
  obtain ⟨y, hy, hfix, hbd⟩ :=
    BeckFialaMatrix.exists_rounding_preserving_integral ht A hA hdeg x hx
  exact ⟨y, hy, fun i hi => hfix i (by rwa [BeckFialaMatrix.mem_floatingCoordinates]), hbd⟩

end BeckFiala
