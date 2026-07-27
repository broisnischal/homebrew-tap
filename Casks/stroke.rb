cask "stroke" do
  arch arm: "aarch64", intel: "x64"

  version "1.16.0"

  on_arm do
    sha256 "31a1d6b79bcdeecf5b55ffb65423d77ff9792bf2631986679b3d5a8ff0c8a0e6"
  end
  on_intel do
    sha256 "00880df0666bb1c87e8edf04d3f8b3cc61702487b77b8f0ea8e3f02ce201f0e5"
  end

  url "https://github.com/broisnischal/stroke/releases/download/v#{version}/stroke_#{version}_#{arch}.dmg"
  name "Stroke"
  desc "Fast desktop database client for PostgreSQL, MySQL, SQLite, and Cloudflare D1"
  homepage "https://github.com/broisnischal/stroke"

  app "Stroke.app"

  # Stroke is ad-hoc signed (no paid Apple Developer cert), so strip the
  # quarantine flag Homebrew applies on download. Without this, Gatekeeper
  # shows "Stroke is damaged and can't be opened."
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Stroke.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.broisnischal.stroke",
    "~/Library/Caches/com.broisnischal.stroke",
    "~/Library/Preferences/com.broisnischal.stroke.plist",
    "~/Library/Saved Application State/com.broisnischal.stroke.savedState",
  ]
end
