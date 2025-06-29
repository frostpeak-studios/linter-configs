# .NET tools

## MegaLint analyzers

Two of the main analyzers used for .NET are `dotnet-format` and `roslynator`, which both autoconfigure
based on the project's `.editorconfig` rather than passing an explicit config file to them.

In this directory we include an `.editorconfig` that contains a **comprehensive** list of analyzer rules
and diagnostics. It's huge, ~4k lines and ~130 kb. This includes some IntelliJ/Rider-specific rules as
well as various other formats such as XML, YAML, JSON, etc.

Many (most?) of the rules are left at default values, making them redundant to explicitly include, but we've
done it anyway. Each rule category has links to its docs, and comments for each rule ID/title for convenience.

As it's .NET-specific and a large file, we've excluded it from the resources that are downloaded with the rest
of the config. If you wish to use this, feel free to copy it into your project root/working directory, or
pull the specific rules out of it that you want to enforce and add them to your `.editorconfig`.

In future releases we may include a script to temporarily place this at the project root for linting (or CI/CD)
and replace it with the existing one after the run. However, we haven't noticed any issues in Rider or performance
degradation so far while using it, so it's not a priority.

### References

#### Tools

- [dotnet-format](https://learn.microsoft.com/en-us/dotnet/core/tools/dotnet-format)
- [Roslynator](https://josefpihrt.github.io/docs/roslynator/)
- [CSharpier](https://csharpier.com/docs/About)
- [EditorConfig](https://editorconfig.org/)

#### Rulesets

- [Microsoft .NET Code Analysis](https://learn.microsoft.com/en-us/dotnet/fundamentals/code-analysis/overview)
- [Roslynator Code Analysis Reference](https://josefpihrt.github.io/docs/roslynator/category/code-analysis/)
- [JetBrains EditorConfig properties](https://www.jetbrains.com/help/rider/Using_EditorConfig.html)

## Standalone Linters/Analyzers

We also use tools that are not supported by MegaLinter.

- [XAML Styler](https://github.com/Xavalon/XamlStyler)
