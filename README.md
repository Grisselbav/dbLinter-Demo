# dbLinter Demo

## Introduction

This repository contains all non-compliant examples from [dbLinter](http://dblinter.app).

The [CI workflow](.github/workflows/ci.yml) uses the [dbLinter CLI](https://grisselbav.github.io/dbLinter/reference/architecture/#cli) to check all SQL files in this repository and the database objects in the Oracle AI Database for compliance
with the dbLinter rules.

The purpose of this repository is to demostrate the use of the dbLinter CLI in a CI/CD environment.

To produce the results a dbLinter configuration with with all rules enabled and default parameters is used.

## Results

### Installation

- [Installation log in Oracle AI Database 23.26.0](https://grisselbav.github.io/dbLinter-Demo/install.log)

### Check

Raw formats produced by the CLI as input for the subsequent steps in the CI workflow:

| Name | Description |
| ---- | ----------- |
| [check.vscode.md](https://grisselbav.github.io/dbLinter-Demo/check.vscode.md) | dbLinter Check Report as Markdown for VS Code. |
| [check.sonarqube.json](https://grisselbav.github.io/dbLinter-Demo/check.sonarqube.json) | [SonarQube](https://docs.sonarsource.com/sonarqube-server/2025.1/analyzing-source-code/importing-external-issues/generic-issue-import-format/) Generic formatted issue report to import issues in any SonarQube edition without any plugin. |
| [check.sarif.sarif](https://grisselbav.github.io/dbLinter-Demo/check.sarif.sarif) | Static Analysis Results Interchange Format ([SARIF](https://docs.oasis-open.org/sarif/sarif/v2.1.0/errata01/os/sarif-v2.1.0-errata01-os-complete.html)) to visualise issues in various tools. See also [Viewers](https://sarifweb.azurewebsites.net/#Viewers). |
| [check.checkstyle.xml](https://grisselbav.github.io/dbLinter-Demo/check.checkstyle.xml) | [Checkstyle](https://github.com/linkedin/pygradle/blob/master/pygradle-plugin/src/test/resources/checkstyle/checkstyle.xsd) XML report. |
| [check.github.txt](https://grisselbav.github.io/dbLinter-Demo/check.github.txt) | [Workflow commands](https://docs.github.com/en/actions/reference/workflows-and-actions/workflow-commands) for GitHub Actions. These commands (annotations) are interpreted when printed to sysout. |
| [check.gitlab.json](https://grisselbav.github.io/dbLinter-Demo/check.gitlab.json) | [GitLab](https://docs.gitlab.com/ci/testing/code_quality/#code-quality-report-format) quality report.  |

The following check results are produced by the workflow:

| Result | Producer | Notes |
| ------ | -------- | ----- |
| [Summary Check Report](https://github.com/Grisselbav/dbLinter-Demo/actions/runs/19996936935#user-content-dblinter-check-report) | [Custom Script](https://github.com/Grisselbav/dbLinter-Demo/blob/main/.github/workflows/ci.yml#L234-L241) | The content of check.vscode.md in the summary page of a run. See also the standalone [HTML](https://grisselbav.github.io/dbLinter-Demo/check-report.html) file. |
| [Annotations](https://github.com/Grisselbav/dbLinter-Demo/actions/runs/19996936935#user-content-core-g-9219) | [Custom Script](https://github.com/Grisselbav/dbLinter-Demo/blob/main/.github/workflows/ci.yml#L136-L141) | The result when printing the content of check.github.txt to sysout. |
| [Code Scanning Alerts](https://github.com/Grisselbav/dbLinter-Demo/security/code-scanning/719) | [github/codeql-action/upload-sarif](https://docs.github.com/en/code-security/code-scanning/integrating-with-code-scanning/uploading-a-sarif-file-to-github) | This action produces code scanning alerts based on the check.sarif.sarif file. The alerts are part of the Security tab, which cannot be made visible to the public. Here's a screenshot ![code scanning alert](images/code-scanning-alert.png) See also [About code scanning alerts](https://docs.github.com/en/code-security/code-scanning/managing-code-scanning-alerts/about-code-scanning-alerts) |
