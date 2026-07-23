cask "stroke" do
  arch arm: "aarch64", intel: "x64"

  version "1.15.0"

  on_arm do
    sha256 "31496c83f1dafa866b31691ef5e5591d395a21e402c835dbea4286c8c6b6600e"
  end
  on_intel do
    sha256 "011db65e3d12375ef25c8793eff49952a42e6d196f421443a9743d102be5f1d4"
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
