# The Beck–Fiala integer-making theorem in Lean 4

Author and maintainer: **Juan Pablo Traverso Gianini**. Licence: Apache-2.0 (see `LICENSE`).

**Theorem (Beck–Fiala, 1981).** Let `A` be a `0/1` matrix in which every column has at most
`t ≥ 1` ones, and let `x ∈ [0,1]^N` (rational coordinates). Then there is `y ∈ {0,1}^N` with
`|∑ᵢ A j i (y i − x i)| < t` for every row `j`; moreover `y` can keep every coordinate of `x` that
is already `0` or `1`.

In set-system language: if every element lies in at most `t` sets, any fractional selection can be
rounded to an integral one changing every set's total by less than `t`.

The audited statements are in [`Challenge.lean`](Challenge.lean), which imports only Mathlib; the
proofs are in [`Solution.lean`](Solution.lean). [`comparator.json`](comparator.json) names the
compared theorems, [`MATHLIB_DEFINITIONS.md`](MATHLIB_DEFINITIONS.md) reproduces verbatim the
Mathlib definitions used, and [`formalization.yaml`](formalization.yaml) records provenance,
sources and process.

## How the proof goes

Call a coordinate *floating* if it is strictly between `0` and `1`. Rows containing more than `t`
floating coordinates are fewer than the floating coordinates (double counting, since every column
has at most `t` ones), so there is a nonzero direction, supported on the floating coordinates,
that keeps the sums of those rows fixed. Moving along it until a coordinate reaches `0` or `1`
reduces the number of floating coordinates; induction finishes the proof, and rows with at most
`t` floating coordinates change by less than `t` at the end
(`LeanPool/BeckFialaMatrix/Basic.lean`).

The module is the author's contribution to [Lean Pool](https://github.com/LeanPool/lean-pool)
(PR #581), copied from Lean Pool commit `26ce45d3871e5560a8baffa4d49a8942b1d20a24`.

## Source

* J. Beck, T. Fiala, *"Integer-making" theorems*, Discrete Appl. Math. 3 (1981) 1–8,
  doi:10.1016/0166-218X(81)90022-6.

## Authorship and use of AI

The result was chosen by the author; the Lean code was written with AI assistance (provenance
recorded as AI in Lean Pool) and checked mechanically with Lean. See `formalization.yaml`.

## Building

Lean `v4.35.0-rc3`, Mathlib `c55e6e786f49471c72fbddbec5415808896aec1e`:

```bash
lake exe cache get
lake build
```
