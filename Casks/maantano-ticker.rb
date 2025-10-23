cask "maantano-ticker" do
  version "1.5.0"

  arch arm: "-arm64", intel: ""

  on_intel do
    sha256 "af6dd174a1a61c548668c64fa4089c838e1e8f4b85b28f6a672be437d759c7bb"
  end

  on_arm do
    sha256 "0da7af83b4da466bcf52b7cf2c6daca600a6ef9020e140a64ce327e5fc24091b"
  end

  url "https://github.com/maantano/maantano-ticker/releases/download/v#{version}/Maantano.Ticker-#{version}#{arch}.dmg"
  name "Maantano Ticker"
  desc "Real-time Korean & US stock ticker for macOS menubar"
  homepage "https://github.com/maantano/maantano-ticker"

  livecheck do
    url :url
    strategy :github_latest
  end

  # Bypass Gatekeeper quarantine for unsigned app
  installer script: {
    executable: "/usr/bin/xattr",
    args: ["-cr", "#{staged_path}/Maantano Ticker.app"]
  }

  app "Maantano Ticker.app"

  zap trash: [
    "~/Library/Application Support/maantano-ticker",
    "~/Library/Preferences/com.maantano-ticker.app.plist",
  ]
end
