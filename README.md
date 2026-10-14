# homebrew-tap

The [Homebrew](https://brew.sh) tap for
[workflow](https://github.com/jacob-delgado/workflow), a terminal UI and CLI
that ties Jira, your team chat and GitHub or GitLab into one developer
workflow.

## Install

```sh
brew install jacob-delgado/tap/workflow
```

Or tap first, then install by name:

```sh
brew tap jacob-delgado/tap
brew install workflow
```

The formula installs the release binary for macOS on Apple silicon or Linux on
x86-64, with bash, zsh and fish completions. On any other platform, see
[Install](https://jacob-delgado.github.io/workflow/docs/install/).

## Upgrade

```sh
brew upgrade workflow
```

## How the formula gets here

`Formula/workflow.rb` is written by
[`scripts/release/package-manifests.sh`](https://github.com/jacob-delgado/workflow/blob/main/scripts/release/package-manifests.sh)
in the workflow repository and committed here by its Packages workflow after
each release. An edit made here is lost at the next release, so change the
script there instead.

Problems with the formula or with workflow itself go to
[workflow's issues](https://github.com/jacob-delgado/workflow/issues).
