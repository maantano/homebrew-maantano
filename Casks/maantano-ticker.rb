cask "maantano-ticker" do
  version "1.3.1"
  sha256 :no_check

  arch arm: "-arm64", intel: ""

  url "https://github.com/maantano/maantano-ticker/releases/download/v#{version}/Maantano.Ticker-#{version}#{arch}.dmg"
  name "Maantano Ticker"
  desc "Real-time Korean stock ticker for macOS menubar with extended hours trading support"
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
