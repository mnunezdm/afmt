# A Fast Configurable Salesforce Apex Formatter

![Release](https://img.shields.io/github/v/release/mnunezdm/afmt)
![License](https://img.shields.io/github/license/mnunezdm/afmt)
![Stars](https://img.shields.io/github/stars/mnunezdm/afmt?style=social)

## Table of Contents

- [A Fast Configurable Salesforce Apex Formatter](#a-fast-configurable-salesforce-apex-formatter)
  - [Table of Contents](#table-of-contents)
  - [Why this fork?](#why-this-fork)
  - [📘 Introduction](#-introduction)
  - [⭐ Features](#-features)
  - [✨ vs. Prettier Apex](#-vs-prettier-apex)
    - [Other Highlights:](#other-highlights)
  - [📥 Installation](#-installation)
    - [1. Script Install](#1-script-install)
      - [For Linux/MacOS](#for-linuxmacos)
      - [For Windows (PowerShell)](#for-windows-powershell)
    - [2. Cargo Install](#2-cargo-install)
    - [3. Manual Download](#3-manual-download)
  - [💻 Usage](#-usage)
    - [Dry Run:](#dry-run)
    - [Format and Write:](#format-and-write)
  - [🔧 Configuration:](#-configuration)
  - [❓ FAQ](#-faq)

## Why this fork?

This fork was originaly made for allowing afmt to be used to uglify/minify instead of prettify. This is done by removing all newlines and whitespaces from the code. This is useful because salesforce measures the size of code based on the actual characters of the code and not the compiled version so removing unnecessary whitespaces will allow to fit more code in the same size and temporarily reduce the size of the code.

Huge credits to the original author of `afmt` [xixiaofinland](https://github.com/xixiaofinland) for creating this amazing tool

## 📘 Introduction

`afmt` (Apex formatting tool) is written in Rust 🦀 and leverages the [tree-sitter sfapex parser](https://github.com/aheber/tree-sitter-sfapex).

## ⭐ Features

- **Performant**
- **Configurable:** via `.afmt.toml`.
- **Standalone:** CLI with no dependencies.
- **Open Source**

<br>

## ✨ vs. Prettier Apex

While both `afmt` and Prettier Apex aim to format Salesforce Apex code, they differ fundamentally in their design philosophies:

- **Prettier Apex:** Maintains an opinionated approach with limited customization to ensure consistency.
- **afmt:** Focuses on extensibility, offering more configuration options to cater to diverse user preferences.

This means `afmt` will progressively introduce more configuration options, addressing user customization needs that Prettier's design intentionally avoids.

### Other Highlights:

| Feature          | afmt                     | Prettier Apex                |
| ---------------- | ------------------------ | ---------------------------- |
| **Maturity**     | Brand new                | Battle tested for years      |
| **Dependencies** | N/A (standalone binary)  | Node.js + Prettier package   |
| **Performance**  | Fast (Rust)              | Relatively slower (Node.js)  |
| **Parser**       | sfapex (C / Open Source) | Jorje (Java / Closed Source) |
| **Open Source**  | Yes                      | Yes                          |

## 📥 Installation

### 1. Script Install

#### For Linux/MacOS

```bash
curl -sL https://raw.githubusercontent.com/mnunezdm/afmt/main/scripts/install-afmt.sh | bash
```

#### For Windows (PowerShell)

```ps1
iwr -useb https://raw.githubusercontent.com/mnunezdm/afmt/main/scripts/install-afmt.ps1 | iex
```

> [!NOTE]
> If you see an error like "This script contains malicious content and has been
> blocked by your antivirus software", it means Microsoft Defender flagged it
> for downloading and executing content from the internet. To proceed, either
> lower Defender’s protection or break the script into smaller steps:

```ps1
# Step 1: Review the script manually
Invoke-WebRequest -Uri https://raw.githubusercontent.com/mnunezdm/afmt/main/scripts/install-afmt.ps1 -OutFile install-afmt.ps1
notepad install-afmt.ps1  # Inspect the content

# Step 2: Run after trust
powershell -ExecutionPolicy Bypass -File install-afmt.ps1
```

<br>

### 2. Cargo Install

`afmt` is published in creates.io [here](https://crates.io/crates/sf-afmt).
Run cmd below if you have the `Cargo` tool.

```bash
cargo install sf-afmt
```

<br>

### 3. Manual Download

Visit the [release page](https://github.com/mnunezdm/afmt/releases/latest) and download the appropriate binary for your operating system (Linux, macOS, or Windows).

<br>

## 💻 Usage

Create a `file.cls` file with valid Apex code.

### Dry Run:

Run `afmt ./file.cls` to preview the formatting result.

```bash
> afmt ./file.cls
Result 0: Ok
global class PluginDescribeResult {
    {
        [SELECT FIELDS(STANDARD) FROM Organization LIMIT 1];
    }
}
```

### Format and Write:

Run `afmt -w ./file.cls` to format the file and overwrite it with the
   formatted code.

```bash
> afmt -w ./file.cls
Formatted content written back to: ./file.cls
Afmt completed successfully.
```
<br>

## 🔧 Configuration:

`-c` parameter can read configuration settings from a toml file.

Example: `afmt -c .afmt.toml`

In `.afmt.toml` config file, two options are supported

```toml
# Maximum line width
max_width = 80

# Indentation size in spaces
indent_size = 4
```

<br>

## ❓ FAQ

- "TLTR, what features afmt has?" Run `afmt -h`.
- "How do I set up afmt in VSCode?"
[Setup in VSCode](./md/VSCode_Setup.md)

- "Can afmt formats exactly the same as Prettier Apex?"
No.