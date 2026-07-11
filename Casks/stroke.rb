cask "stroke" do
  arch arm: "aarch64", intel: "x64"

  version "1.9.0"

  on_arm do
    sha256 "5fcbbe78d6859a7ef82c01fcb568fd52b08eec5de5c8e9e23c259701da93b359"
  end
  on_intel do
    sha256 "0f55830593cd492d4330371ecbbfee5e73fb85b7ff5f0e0e6ff657e64dc97e2c"
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
