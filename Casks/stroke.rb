cask "stroke" do
  arch arm: "aarch64", intel: "x64"

  version "1.19.0"

  on_arm do
    sha256 "733311a4f84f31eea6068e2b0aff23641f11b5a91e7844783a4f066abccb8a3d"
  end
  on_intel do
    sha256 "848195750991494e4b4aa32723c2e9018eecc891ed44fd413505d722376a98d6"
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
