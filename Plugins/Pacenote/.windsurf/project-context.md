# Project Context: Pacenote Plugin Translation Management

## 1. Overall Goal

The primary objective of this project is to manage, update, and synchronize Pacenote (co-driver call) translations for the Richard Burns Rally Pacenote plugin, specifically focusing on German translations. This involves:

*   Extraction and consolidation of existing translations from older file versions.
*   Continuous updating of new translation files with the extracted translations.
*   Ensuring accuracy through systematic translation updates.
*   Providing mechanisms for safe updates (e.g., dry-runs).
*   Comprehensive documentation of Pacenote terms and their translations.
*   Maintenance of project documentation in `.windsurf` directory.

## 2. Key Directories

*   **Base Project Directory:** `c:\Richard_Burns_Rally-V3\Plugins\Pacenote\`
*   **Old German Translations (Source):** `language-bak\german\`
*   **New German Translations (Target):** `language\german\`
*   **Consolidated Old Translations Output:** `uebersetzungen-alt.txt` (in base directory)
*   **General Pacenote Documentation Output:** `doku.rtf` (for specific `strings.ini` files, e.g., `road/strings.ini`)

## 3. Core Task: Translation Synchronization

The core task revolves around ensuring that the `language/german/` directory accurately reflects German translations, leveraging the content from `language-bak/german/`. This includes handling the modular structure of `strings.ini` files within various subdirectories (e.g., `pacenotes/packages/`).

## 4. Workflow Enhancement (ab 2025-06-03)

*   **Persistent Context Storage:** Utilize a `.windsurf` directory within the project for session notes, overall project context, and a knowledge base.
    *   `.windsurf/session-notes.md`: Updated after each session with activities, key findings, and next steps.
    *   `.windsurf/project-context.md`: Stores architectural decisions and high-level project information.
    *   `.windsurf/knowledge-base.md`: Documents code patterns, conventions, and technical details.
