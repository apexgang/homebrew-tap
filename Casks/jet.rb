cask "jet" do
  version "1.0.7"
  sha256 "3fbe47c476bcdaa1e9507ee8c74ec8cb3538e15f2c91afc2fe889c4b822ec907"

  url "https://github.com/apexgang/jet/releases/download/swift-v1.0.7/jet-app-1.0.7.dmg"
  name "Jet"
  desc "Native workspace for Jet coding agent conversations"
  homepage "https://github.com/apexgang/jet"

  depends_on macos: :tahoe
  depends_on formula: "apexgang/tap/jet"

  app "jet.app"
end
