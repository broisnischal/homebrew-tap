cask "stroke" do
  arch arm: "aarch64", intel: "x64"

  version "1.2.0"

  on_arm do
    sha256 "ff3c1638fe0a7c93d5ac3dadc202a4de1c7ab6f2cadfa4f16d3e720f3b53d0e0"
  end
  on_intel do
    sha256 "e8e25daad5ff315a0430c9679ad7fa75f9f9301fb4a6fe1c03bb57333ec8c4d7"
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
