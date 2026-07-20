# `nixd` — nix-darwin helper

`nixd` is a small wrapper script that bundles the nix-darwin / Nix commands you
run all the time behind short subcommands, so you never have to retype
`sudo darwin-rebuild switch --flake ~/.config/nix-darwin#a` (and friends) again.

- **Script:** [`bin/nixd`](../bin/nixd) (plain Bash — edit it freely, no rebuild needed)
- **Targets:** the flake in this repo, `~/.config/nix-darwin#a`, automatically.

---

## Installation / how it gets on your PATH

The script lives at `~/.config/nix-darwin/bin/nixd`. That directory is added to
your `PATH` declaratively via `home/home.nix`:

```nix
home.sessionPath = [ "${config.home.homeDirectory}/.config/nix-darwin/bin" ];
```

So after the **next** `darwin-rebuild switch` **and** opening a **new shell**, you
can call `nixd` from anywhere. Until then (or any time PATH isn't set up yet),
call it by full path:

```sh
~/.config/nix-darwin/bin/nixd <command>
```

> Because `home.sessionPath` is applied by the switch itself, the very first
> activation is a chicken-and-egg: run `~/.config/nix-darwin/bin/nixd switch`
> once by full path; afterwards `nixd` is on PATH.

---

## Important: run it in a real terminal

Commands that activate or clean the system use `sudo`, which needs a terminal to
prompt for your password. **Run `nixd` in a real terminal** (Terminal.app,
iTerm, WezTerm) — not through a non-interactive context (e.g. the `!` prefix in
Claude Code, cron, or piped input), where `sudo` will fail with
*"a terminal is required to read the password"*.

Commands that **don't** need sudo work anywhere: `build`, `update`, `info`,
`search`, `fmt`, `edit`, `path`, `help`, `optimise`.

---

## Command reference

Run `nixd help` (or `nixd -h`) for the built-in summary. Full details:

| Command | Alias | sudo | Runs | Purpose |
|---|---|:---:|---|---|
| `switch` | `s` | ✅ | `darwin-rebuild switch --flake ~/.config/nix-darwin#a` | Build **and activate** the configuration. The everyday "apply my changes". |
| `build` | `b` | — | `darwin-rebuild build --flake …#a` | Build the system **without activating**. Safe way to check a change compiles. |
| `check` | | — | `darwin-rebuild check --flake …#a` | Build and run the configuration's checks. |
| `rollback` | | ✅ | `nix-env --rollback -p /nix/var/nix/profiles/system` then `darwin-rebuild activate` | Revert to the **previous generation** and activate it. |
| `generations` | `gen` | ✅ | `nix-env -p /nix/var/nix/profiles/system --list-generations` | List all system generations with dates. |
| `update` | `up` | — | `cd ~/.config/nix-darwin && nix flake update` | Bump `flake.lock` (update nixpkgs / nix-darwin / home-manager). **Does not rebuild.** |
| `upgrade` | `U` | ✅ | `nix flake update` **then** `darwin-rebuild switch` | Update inputs and immediately apply them. |
| `info` | | — | `nix flake metadata ~/.config/nix-darwin` | Show flake metadata and locked input revisions. |
| `gc [DAYS]` | | ✅ | `sudo nix-collect-garbage --delete-older-than {DAYS}d` + user GC | Delete generations older than `DAYS` (default **30**) and collect garbage to free disk. |
| `optimise` | `optimize` | — | `nix store optimise` | Deduplicate the store by hard-linking identical files. |
| `repair` | | ✅ | `nix-store --repair --verify --check-contents` | Verify store integrity and repair corrupted paths. |
| `fmt` | | — | `cd … && nix run nixpkgs#alejandra -- .` | Format every `.nix` file in the repo with **alejandra**. |
| `search` | | — | `nix search nixpkgs <PKG>` | Search nixpkgs for a package. Requires an argument. |
| `edit` | | — | `cd … && $EDITOR .` | Open the config directory in `$EDITOR` (falls back to `nvim`). |
| `path` | | — | prints `~/.config/nix-darwin#a` | Print the flake reference the script uses. |
| `help` | `-h`, `--help` | — | — | Show the usage summary. |

---

## Before / after — the command it replaces

| Task | Old command (what you'd type by hand) | With `nixd` |
|---|---|---|
| Rebuild & activate | `sudo darwin-rebuild switch --flake ~/.config/nix-darwin#a` | `nixd switch` |
| Build only (test) | `darwin-rebuild build --flake ~/.config/nix-darwin#a` | `nixd build` |
| Run checks | `darwin-rebuild check --flake ~/.config/nix-darwin#a` | `nixd check` |
| Update inputs | `cd ~/.config/nix-darwin && nix flake update` | `nixd update` |
| Update **and** rebuild | `cd ~/.config/nix-darwin && nix flake update && sudo darwin-rebuild switch --flake ~/.config/nix-darwin#a` | `nixd upgrade` |
| Flake metadata | `nix flake metadata ~/.config/nix-darwin` | `nixd info` |
| Garbage collect (>30d) | `sudo nix-collect-garbage --delete-older-than 30d` | `nixd gc` |
| Garbage collect (>7d) | `sudo nix-collect-garbage --delete-older-than 7d` | `nixd gc 7` |
| Optimise / dedupe store | `nix store optimise` | `nixd optimise` |
| List generations | `sudo nix-env -p /nix/var/nix/profiles/system --list-generations` | `nixd gen` |
| Roll back | `sudo nix-env --rollback -p /nix/var/nix/profiles/system && sudo darwin-rebuild activate` | `nixd rollback` |
| Repair store | `sudo nix-store --repair --verify --check-contents` | `nixd repair` |
| Format `.nix` files | `cd ~/.config/nix-darwin && nix run nixpkgs#alejandra -- .` | `nixd fmt` |
| Search nixpkgs | `nix search nixpkgs ripgrep` | `nixd search ripgrep` |
| Edit the config | `cd ~/.config/nix-darwin && $EDITOR .` | `nixd edit` |

---

## Configuration

The script reads two optional environment variables (with sensible defaults):

| Variable | Default | Meaning |
|---|---|---|
| `NIXD_FLAKE` | `~/.config/nix-darwin` | Path to the flake directory. |
| `NIXD_HOST` | `a` | The `darwinConfigurations.<name>` attribute (your hostname). |

Example — operate on a different flake for one command:

```sh
NIXD_FLAKE=~/other-config NIXD_HOST=laptop nixd build
```

It also resolves `darwin-rebuild` to an absolute path before calling `sudo`
(since `sudo` strips `PATH`), falling back to
`/run/current-system/sw/bin/darwin-rebuild`.

---

## Common workflows

**Apply config changes (the daily driver):**
```sh
nixd switch
```

**Test a change without activating it first:**
```sh
nixd build      # compiles everything; nothing is activated
nixd switch     # once build is happy
```

**Update everything to the latest and apply:**
```sh
nixd upgrade    # = nixd update + nixd switch
```
…or in two steps if you want to inspect the lockfile diff first:
```sh
nixd update
git -C ~/.config/nix-darwin diff flake.lock
nixd switch
```

**Free up disk space:**
```sh
nixd gc          # remove generations older than 30 days + collect garbage
nixd gc 7        # more aggressive: older than 7 days
nixd optimise    # then hard-link duplicate store paths
```

**Something broke after a switch — go back:**
```sh
nixd gen         # see the list
nixd rollback    # activate the previous generation
```

**Find and add a package:**
```sh
nixd search obsidian
nixd edit        # add it to the relevant packages/*.nix file
nixd switch
```

---

## Troubleshooting

| Symptom | Cause / fix |
|---|---|
| `sudo: a terminal is required to read the password` | You ran it non-interactively (e.g. the `!` prefix). Run in a real terminal, or pre-cache with `sudo -v` first. |
| `nixd: command not found` | Not on PATH yet. Use the full path `~/.config/nix-darwin/bin/nixd`, run a `switch`, then open a **new** shell. |
| `error: … is not tracked by Git` (during build/switch) | Flakes ignore untracked files. `git add` any new `.nix` files in the repo, then retry. |
| `sudo` prompts every time | Expected — macOS doesn't cache sudo across separate invocations by default. |

---

## Extending it

`bin/nixd` is a plain Bash `case` statement — add a new branch to teach it a new
command, e.g.:

```sh
diff)  exec nix run nixpkgs#nvd -- diff /run/current-system ./result ;;
```

Because it's a plain file on your PATH (not built into the Nix store), edits take
effect immediately — no rebuild required.
