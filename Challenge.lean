/-
Copyright (c) 2026 Juan Pablo Traverso Gianini. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Juan Pablo Traverso Gianini
-/
module

public import Mathlib

/-!
# The Beck–Fiala integer-making theorem

**Theorem (Beck–Fiala, 1981).** Let `A` be an `m × N` matrix with entries in `{0, 1}` in which
every column has at most `t ≥ 1` ones (every element lies in at most `t` sets of the set system
whose incidence matrix is `A`), and let `x ∈ [0, 1]^N`. Then there is `y ∈ {0, 1}^N` such that
for every row `j`, `|∑ᵢ A j i (y i - x i)| < t`.

The strengthened form also keeps every coordinate of `x` that is already `0` or `1`.

The Mathlib definitions used in these statements are reproduced verbatim, with file and line at
the pinned Mathlib revision, in `MATHLIB_DEFINITIONS.md` at the root of this repository.
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
      ∀ j, |∑ i, (A j i : ℚ) * ((y i : ℚ) - x i)| < (t : ℚ) := by
  sorry

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
  sorry

end BeckFiala
