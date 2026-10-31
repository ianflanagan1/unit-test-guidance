# Spec-drawn examples

For unit tests. Choose the examples a test runs from what the unit is meant to do, never from how it does it. A test chosen this way stays valid under any correct implementation, and fails under any wrong one that its examples can expose.

This file is framework-agnostic. A binding in `bindings/` says how its terms map onto one test framework; apply this file with the binding for the framework the tests use.

## Terms

- **Spec**: what the unit is meant to do. Its documentation, the requirement it meets, and the rules of any language, format or protocol it models. Not its code.
- **Behaviour**: one statement of what the unit does, such as "a bare literal names every argument". A behaviour names a test.
- **Example**: one input, with its expected result, that demonstrates a behaviour. A behaviour has one or more examples.

## Choosing examples

1. **Write the examples from the spec before reading the implementation.** Don't drop an example because the implementation handles it through the same path as another. That the code shares a path today is an assumption about the code, and the test has to survive the code changing.
2. **Give every case the spec lists its own example.** "True, false, null, a number, `''` or `[]`" is six cases, so it needs at least six examples, whichever of them the code treats alike.
3. **Sample every dimension the spec defines by a property, within each listed case it applies to.** "Any case" or "any number" can't be covered exhaustively, so choose examples that plausibly wrong implementations would get wrong. Name a few such implementations (an exact match, a hard-coded list of spellings, a check for one sign only) and make sure some example fails each one. This means thinking about possible implementations, not the actual one. For example, case-insensitive `true`, `false` and `null` means lower, upper and mixed case for each of the three, which is nine examples. Numbers need zero, negative, and integer as well as float. Where the dimension is large and its examples are cheap, a property-based test can sweep it.
4. **Give every spelling the spec treats as the same thing its own example**: a fully qualified `\null`, `""` as well as `''`.
5. **Give the behaviour examples just outside its boundary**, which it must not apply to: the near misses on each edge of each listed case. If a bare literal is an empty string or an empty array, near misses include `'0'`, `[0]` and a constant named `TRUE_VALUE`. These examples belong to the matching "left alone" behaviour.

## Relying on the platform

Rely on a guarantee from the language, runtime or library only where the unit hands the work to it. Where the unit does the work itself, test it against the platform's rules.

- If the unit delegates (it evaluates the value, calls the library and uses the result), the guarantee is the platform's. Don't test it. Code that branches on a PHP `TRUE` relies on PHP treating `TRUE` as `true`.
- If the unit reimplements, inspects or parses (it matches source text, compares names, decodes a format), the platform's rules become part of the unit's spec. A Rector rule that reads the name of a constant gets `TRUE` exactly as it was written in the source. It has to compare names without regard to case itself, so the case examples in point 3 are needed.

## Structuring tests

- Make one behaviour one named test, with its examples as that test's data. Name each example so that a failure shows which example broke.
- Name an example for what varies in it ("an upper-case TRUE"), not for the expected result, which the behaviour already states.
- Don't split one behaviour's examples into separately named tests, and don't merge two behaviours so they can share data. An example that needs different setup or a different assertion from the others belongs to a different behaviour.
- Keep a behaviour with a single example in the same shape as one with many, so adding an example renames nothing.
