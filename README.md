# Homebrew Tap for Stroke

A [Homebrew](https://brew.sh) tap for [Stroke](https://github.com/broisnischal/stroke) — a fast desktop database client for PostgreSQL, MySQL, SQLite, and Cloudflare D1.

## Install

```sh
brew install --cask broisnischal/tap/stroke
```

That's it — no Gatekeeper warnings, no manual `xattr`. Homebrew handles the quarantine flag for you.

## Update

```sh
brew upgrade --cask stroke
```

(Stroke also updates itself in-app.)

## Uninstall

```sh
brew uninstall --cask stroke
```

---

The cask here is kept in sync with the latest [Stroke release](https://github.com/broisnischal/stroke/releases) automatically by [`update-cask.yml`](.github/workflows/update-cask.yml).
