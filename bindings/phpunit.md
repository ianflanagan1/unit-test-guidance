# Binding: PHPUnit

How the terms of [spec-drawn examples](../spec-drawn-examples.md) map onto PHPUnit.

- **Behaviour**: a test method, `test_<behaviour>`.
- **Examples**: a data provider for that method alone, attached with `#[DataProvider('<behaviour>_examples')]`. It is a `public static` method that yields one example per entry, keyed by the example's name: `yield 'an upper-case TRUE' => ['TRUE'];`. PHPUnit prints the key when that example fails.
- **A behaviour with one example** still gets a provider with one entry.
- Don't use `#[TestWith]`, since it can't name its examples.
