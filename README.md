# Unit test guidance

Guidance for writing unit tests, to be imported into the skills and prompts that generate them. Each guidance file is framework-agnostic. It defines its own terms, and the files in `bindings/` map those terms onto a single test framework.

| Guidance | What it settles |
|---|---|
| [Spec-drawn examples](spec-drawn-examples.md) | Which examples a test runs, chosen from the spec rather than the implementation, and how they are grouped under behaviours. |

| Binding | Framework |
|---|---|
| [PHPUnit](bindings/phpunit.md) | PHPUnit test methods and data providers |
| [Rector fixtures](bindings/rector-fixtures.md) | `.php.inc` fixtures run by `AbstractRectorTestCase` |

## Importing

A skill tells Claude to read each guidance file it applies, together with the binding for the framework it writes tests in, by absolute path: `~/projects/claude/unit-test-guidance/spec-drawn-examples.md`. Skills point to these files and never copy them, so this repository stays the only copy.

To add guidance, write a file named for it and add a row to the first table. To add a framework, write a binding that maps every term the guidance defines and add a row to the second table.

## Nix

`flake.nix` packages every Markdown file here, keeping the directory layout, under `share/unit-test-guidance/` in its default package. Build it with `nix build`, or add this repository as a flake input to install it elsewhere.
