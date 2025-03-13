import Lake
open Lake DSL

package "lean_test_4160" where
  version := v!"0.1.0"

@[default_target]
lean_lib «LeanTest4160» where
  -- add library configuration options here

require mathlib from git
  "https://github.com/leanprover-community/mathlib4" @ "v4.16.0"

require REPL from git
  "https://github.com/leanprover-community/repl.git" @ "v4.16.0"

require jixia from git
  "https://github.com/frenzymath/jixia.git" @ "v4.16.0"
