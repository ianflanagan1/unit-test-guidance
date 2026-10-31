# Binding: Rector fixtures

How the terms of [spec-drawn examples](../spec-drawn-examples.md) map onto the fixture tests of a Rector rule, which run every `.php.inc` file under `tests/Fixture/` through the rule.

- **Behaviour**: a directory under `tests/Fixture/`, named for the behaviour: `a_bare_literal_names_every_argument/`.
- **Examples**: a `.php.inc` file in that directory for each example, named for what varies in it: `true_in_upper_case.php.inc`. `AbstractRectorTestCase::yieldFilesFromDirectory()` searches subdirectories (through Symfony Finder) and labels each data set with the fixture's path, so a failure shows both the behaviour and the example.
- **A behaviour with one example** is still a directory, holding one file.
- Examples of a "left alone" behaviour are fixtures with no `-----` line.
