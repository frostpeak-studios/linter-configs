# Linter Configs

Shared repo that contains config files for various linters, scanners and code analysis/quality tools. This is meant
to be a central repository for configs so that we don't need to maintain them across many different projects.

Most of our projects are done in .NET, so there's a heavy focus on that ecosystem and its tooling. Feel free to open a
PR to add config(s) that are missing from the collection.

## Table of Contents

- [Getting Started](#getting-started)
  - [Remote Linking](#remote-linking)
  - [Submodule](#submodule)
- [Configs](#configs)
  - [Languages](#languages)
  - [Formats](#formats)
  - [Tooling](#tooling)
  - [Other/Repository](#otherrepository)
  - [Exceptions](#exceptions)
    - [.NET](#net)
    - [Prettier](#prettier)
    - [Proselint](#proselint)

[.NET analyzers](dotnet/README.md)

## Getting Started

This is designed for use with [MegaLinter](https://megalinter.io/latest/). The `.mega-linter.yml` config file can point
directly to this repo, or add this repo to a project as a submodule and point the config to the submodule's directory.

### Remote Linking

This is the easiest way to consume the configs, just setting a single line in your `.mega-linter.yml` config.
The downside to this is if you use `mega-linter-runner` locally, it will download all the config files to the root
of your repository.

The `LINTER_RULES_PATH` can be set to point to the directory containing the config files. MegaLinter requires
the raw user content, so be sure to modify the URL accordingly and add the blob path.

```yaml
LINTER_RULES_PATH: https://raw.githubusercontent.com/frostpeak-studios/linter-configs/refs/heads/main/resources
```

### Submodule

Adding this repo as a submodule allows you to control the path they are downloaded to and keep your project's root
clean. The downside to this is... _submodules_.

```sh
git submodule add https://github.com/frostpeak-studios/linter-configs .config/linters
git submodule init
```

## Configs

Opinionated configs for various linters and scanners used by [MegaLinter](https://megalinter.io/latest/).
Most of them more or less follow the default ruleset for the particular language or framework, with some changes. All
configs contain a link to their documentation.

The following tables list the different tools supported by [MegaLinter](https://megalinter.io/latest/) and whether this
repo includes a configuration for them or not.

Entries marked with an asterisk (*) next to their included icon have [exceptions](#exceptions), which are
listed at the bottom.

Entries marked with (➖) as their included status do not support configs, possibly due to the tool not supporting
custom configuration, or MegaLinter not supporting the passing of an external configuration file via env variable.
In these cases, you may still be able to customize using CLI args or overriding the linter executable.

### Languages

| Category          | Tool Name                  | Included |
|-------------------|----------------------------|:--------:|
| BASH              | bash-exec                  |    ➖     |
| BASH              | shellcheck                 |    ➖     |
| BASH              | shfmt                      |    ➖     |
| C / C++           | cppcheck                   |    ✅     |
| C / C++           | cpplint                    |    ➖     |
| C / C++           | clang-format               |    ✅     |
| CLOJURE           | clj-kondo                  |    ❌     |
| CLOJURE           | cljstyle                   |    ❌     |
| COFFEE            | coffeelint                 |    ❌     |
| CSHARP            | dotnet-format              |    ✅*    |
| CSHARP            | csharpier                  |    ✅     |
| CSHARP            | roslynator                 |    ✅*    |
| DART              | dartanalyzer               |    ❌     |
| GO                | golangci-lint              |    ❌     |
| GO                | revive                     |    ❌     |
| GROOVY            | npm-groovy-lint            |    ❌     |
| JAVA              | checkstyle                 |    ❌     |
| JAVA              | pmd                        |    ❌     |
| JAVASCRIPT        | eslint                     |    ❌     |
| JAVASCRIPT        | standard                   |    ➖     |
| JAVASCRIPT        | prettier                   |    ✅*    |
| JSX               | eslint                     |    ❌     |
| KOTLIN            | ktlint                     |    ➖     |
| KOTLIN            | detekt                     |    ❌     |
| LUA               | luacheck                   |    ❌     |
| LUA               | selene                     |    ❌     |
| LUA               | stylua                     |    ❌     |
| MAKEFILE          | checkmate                  |    ❌     |
| PERL              | perlcritic                 |    ➖     |
| PHP               | phpcs                      |    ❌     |
| PHP               | phpstan                    |    ❌     |
| PHP               | psalm                      |    ❌     |
| PHP               | phplint                    |    ❌     |
| PHP               | php-cs-fixer               |    ❌     |
| POWERSHELL        | psscriptanalyzer           |    ✅     |
| POWERSHELL        | psscriptanalyzer_formatter |    ✅     |
| PYTHON            | pylint                     |    ❌     |
| PYTHON            | black                      |    ❌     |
| PYTHON            | flake8                     |    ❌     |
| PYTHON            | isort                      |    ❌     |
| PYTHON            | bandit                     |    ❌     |
| PYTHON            | mypy                       |    ❌     |
| PYTHON            | pyright                    |    ❌     |
| PYTHON            | ruff                       |    ❌     |
| PYTHON            | ruff-format                |    ❌     |
| R                 | lintr                      |    ❌     |
| RAKU              | raku                       |    ❌     |
| RUBY              | rubocop                    |    ❌     |
| RUST              | clippy                     |    ❌     |
| SALESFORCE        | sfdx-scanner-apex          |    ❌     |
| SALESFORCE        | sfdx-scanner-aura          |    ❌     |
| SALESFORCE        | sfdx-scanner-lwc           |    ❌     |
| SALESFORCE        | lightning-flow-scanner     |    ❌     |
| SCALA             | scalafix                   |    ❌     |
| SQL               | sqlfluff                   |    ✅     |
| SQL               | tsqllint                   |    ❌     |
| SWIFT             | swiftlint                  |    ❌     |
| TSX               | eslint                     |    ❌     |
| TYPESCRIPT        | eslint                     |    ❌     |
| TYPESCRIPT        | ts-standard                |    ➖     |
| TYPESCRIPT        | prettier                   |    ✅*    |
| VISUAL BASIC .NET | dotnet-format              |    ✅     |

### Formats

| Category | Tool Name                | Included |
|----------|--------------------------|:--------:|
| CSS      | stylelint                |    ❌     |
| ENV      | dotenv-linter            |    ➖     |
| GRAPHQL  | graphql-schema-linter    |    ❌     |
| HTML     | djlint                   |    ➖     |
| HTML     | htmlhint                 |    ✅     |
| JSON     | jsonlint                 |    ✅     |
| JSON     | eslint-plugin-jsonc      |    ❌     |
| JSON     | v8r                      |    ✅     |
| JSON     | prettier                 |    ✅*    |
| JSON     | npm-package-json-lint    |    ❌     |
| LATEX    | chktex                   |    ❌     |
| MARKDOWN | markdownlint             |    ✅     |
| MARKDOWN | remark-lint              |    ❌     |
| MARKDOWN | markdown-link-check      |    ✅     |
| MARKDOWN | markdown-table-formatter |    ➖     |
| PROTOBUF | protolint                |    ❌     |
| RST      | rst-lint                 |    ➖     |
| RST      | rstcheck                 |    ❌     |
| RST      | rstfmt                   |    ➖     |
| XML      | xmllint                  |    ➖     |
| YAML     | prettier                 |    ✅*    |
| YAML     | yamllint                 |    ✅     |
| YAML     | v8r                      |    ✅     |

### Tooling

| Category       | Tool Name            | Included |
|----------------|----------------------|:--------:|
| ACTION         | actionlint           |    ✅     |
| ANSIBLE        | ansible-lint         |    ❌     |
| API            | spectral             |    ✅     |
| ARM            | arm-ttk              |    ❌     |
| BICEP          | bicep_linter         |    ➖     |
| CLOUDFORMATION | cfn-lint             |    ❌     |
| DOCKERFILE     | hadolint             |    ❌     |
| EDITORCONFIG   | editorconfig-checker |    ✅     |
| GHERKIN        | gherkin-lint         |    ❌     |
| KUBERNETES     | kubeconform          |    ➖     |
| KUBERNETES     | helm                 |    ➖     |
| KUBERNETES     | kubescape            |    ➖     |
| PUPPET         | puppet-lint          |    ❌     |
| SNAKEMAKE      | snakemake            |    ➖     |
| SNAKEMAKE      | snakefmt             |    ❌     |
| TEKTON         | tekton-lint          |    ❌     |
| TERRAFORM      | tflint               |    ✅     |
| TERRAFORM      | terrascan            |    ❌     |
| TERRAFORM      | terragrunt           |    ❌     |
| TERRAFORM      | terraform-fmt        |    ➖     |

### Other/Repository

| Category    | Tool Name  | Included |
|-------------|------------|:--------:|
| COPYPASTE   | jscpd      |    ✅     |
| REPOSITORY  | checkov    |    ✅     |
| REPOSITORY  | devskim    |    ✅     |
| REPOSITORY  | dustilock  |    ❌     |
| REPOSITORY  | git_diff   |    ✅     |
| REPOSITORY  | gitleaks   |    ✅     |
| REPOSITORY  | grype      |    ✅     |
| REPOSITORY  | kics       |    ✅     |
| REPOSITORY  | ls-lint    |    ❌     |
| CREDENTIALS | secretlint |    ✅     |
| REPOSITORY  | semgrep    |    ❌     |
| REPOSITORY  | syft       |    ✅     |
| REPOSITORY  | trivy      |    ✅     |
| REPOSITORY  | trivy-sbom |    ✅     |
| REPOSITORY  | trufflehog |    ❌     |
| SPELL       | cspell     |    ✅     |
| SPELL       | proselint  |    ❌*    |
| SPELL       | vale       |    ✅     |
| SPELL       | lychee     |    ✅     |

### Exceptions

#### .NET

`dotnet-format` does not allow for explicitly setting a configuration file. It will read the contents
of the `.editorconfig` file in the project.

`roslynator` does not allow for explicitly setting a configuration file. It will read the contents
of the `.editorconfig` file in the project.

For these, we have included the `dotnet/.editorconfig` separately. Copy this to the project root or working directory
to enable the rules for these analyzers.

#### Prettier

We include a general config for Prettier that doesn't have any language-specific rules. It's used mostly for
JSON and YAML, and in future updates we intend to provide separate configs for each language it supports.

#### Proselint

The config for `vale` includes the `proselint` package, making it redundant as a standalone linter, so we don't use it.
