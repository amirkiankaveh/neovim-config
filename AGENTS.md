# Repository Guidelines

Use this guide to keep contributions aligned with the LazyVim configuration in this repo.

## Project Structure & Module Organization
- `init.lua` boots LazyVim and loads local modules.
- `lua/config/` houses core behavior (`options.lua`, `keymaps.lua`, `autocmds.lua`, `lazy.lua`).
- `lua/plugins/` keeps one-plugin-per-file specs; mirror this pattern when adding tools.
- `assets/` stores documentation media; keep large binaries out of Git.
- `lazy-lock.json` pins plugin commits—update it only through Lazy operations.

## Build, Test, and Development Commands
- `nvim --headless "+Lazy sync" +qa` installs or updates plugins against the lock file.
- `nvim --headless "+Lazy check" +qa` validates plugin health after changes.
- `nvim --headless "+checkhealth" +qa` runs Neovim diagnostics; resolve warnings before review.
- `stylua lua` formats all Lua files; Conform's `:Format` handles quick buffer fixes.

## Coding Style & Naming Conventions
- Lua uses two-space indentation and a 120-column width (`stylua.toml`).
- Require paths mirror folders (e.g., `require("config.options")`).
- Plugin specs should return plain tables and live in descriptively named files.
- Comments explain intent only; avoid narrating obvious code.

## Testing Guidelines
- No automated suite exists; rely on `Lazy check`, `checkhealth`, and `nvim --clean -u init.lua` to confirm startup.
- After adding keymaps or commands, verify them via `:Telescope keymaps` or the plugin's status UI.
- Document manual verification steps in PRs when behavior is user-facing.

## Commit & Pull Request Guidelines
- Follow conventional commits (`feat:`, `fix:`, `update:`) with subjects under 72 characters.
- Squash experimental commits before pushing.
- PRs need a concise summary, linked issues when relevant, and screenshots for UI-facing updates.
- Call out side effects (e.g., lockfile refresh) so reviewers can validate them.

## Agent Notes
- Add plugins by creating `lua/plugins/<feature>.lua` and returning the spec; Lazy manages load order.
- Gate unfinished work with `enabled = false` until it is ready for feedback.
- Keep secrets out of tracked files—store tokens in env vars or local untracked configs.
