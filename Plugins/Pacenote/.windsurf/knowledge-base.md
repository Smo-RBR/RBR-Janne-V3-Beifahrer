# Knowledge Base: Pacenote Plugin Project

## 1. File Handling and Parsing

### 1.1. INI File Structure (`strings.ini`)
*   Pacenote translations are stored in `strings.ini` files.
*   These files contain a `[STRINGS]` section with key-value pairs.
*   Keys represent Pacenote terms (e.g., `CREST`), and values are the translated strings.
*   Files use UTF-8 encoding, often with a Byte Order Mark (BOM).
*   Documentation is generated in RTF format (`doku.rtf`) for specific `strings.ini` files.
*   Recent translation improvements include:
    *   Rally-specific context in translations
    *   Clearer instructions for drivers
    *   Marking deprecated terms with "(veraltet)"
    *   More precise speed-related terms
    *   Better handling of sight distance instructions

### 1.2. Python `configparser` Usage
*   The `configparser` module in Python is used for reading and writing INI files.
*   **Settings for Robust Parsing:**
    *   `allow_no_value=True`
    *   `interpolation=None`: To prevent errors with special characters like `%` in values.
    *   `strict=False`: To be more lenient with INI file structure.
    *   `comment_prefixes=('#', ';')`
    *   `delimiters=('=')`
*   **Encoding:** Files are read and written using `utf-8-sig` to correctly handle BOMs and UTF-8 characters.

### 1.3. Case Insensitivity
*   Pacenote keys are generally treated case-insensitively during comparison and lookup (e.g., by converting keys to lowercase).

### 1.4. Manual Parsing Fallback
*   For `strings.ini` files that might be missing standard section headers (e.g., `[STRINGS]`), a manual line-by-line parsing fallback is implemented in `translation_extractor.py`.

## 2. Scripting Conventions

### 2.1. `translation_extractor.py`
*   **Purpose:** Extracts all unique German translations from the `language-bak/german/` directory.
*   **Functionality:**
    *   Recursively scans all `strings.ini` files.
    *   Uses `configparser` with robust settings and manual fallback.
    *   Stores unique translations (case-insensitive keys) in a dictionary.
    *   Outputs the consolidated list to `uebersetzungen-alt.txt`.

### 2.2. `translation_updater.py`
*   **Purpose:** Updates `language/german/` translation files using translations from `uebersetzungen-alt.txt`.
*   **Functionality:**
    *   Loads translations from `uebersetzungen-alt.txt`.
    *   Recursively scans `strings.ini` files in the target directory.
    *   Reads files line by line to preserve comments and original formatting.
    *   Replaces English values with German translations if a match is found.
    *   Supports a `--dry-run` mode.
    *   Handles keys case-insensitively.

## 3. Translation File Structure
*   Both old (`language-bak`) and new (`language`) translation directories have a main `strings.ini` and subdirectories (e.g., `pacenotes/packages/`) containing thematic `strings.ini` files (e.g., `corners`, `cautions`, `road`).
*   The file `language/german/pacenotes/packages/strings.ini` acts as a central list of Pacenote keys and categories, often with English values serving as sound file aliases or default calls.

## 4. Documentation Generation
*   **RTF Format:** For detailed documentation of specific `strings.ini` files (like `road/strings.ini`), RTF files (e.g., `doku.rtf`) are generated. These combine Pacenote keys, their German translations, and detailed English descriptions provided by the user.
*   **Markdown Format (`.windsurf` directory):** For ongoing project documentation:
    *   `session-notes.md`: Summaries of interactive sessions.
    *   `project-context.md`: High-level project goals and architectural decisions.
    *   `knowledge-base.md`: Code patterns, technical conventions, and established knowledge.

## 5. Workflow Rules (ab 2025-06-03)

1.  **Startup Procedure:** Read all files from `.windsurf/` at the beginning of each session.
2.  **Session Summary:** Update `.windsurf/session-notes.md` after each session with:
    *   What was done.
    *   Important findings/insights.
    *   Next steps.
3.  **Architecture Decisions:** Store all architectural decisions in `.windsurf/project-context.md`.
4.  **Code Patterns & Conventions:** Document code patterns and conventions in `.windsurf/knowledge-base.md`.
