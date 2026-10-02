cask "jet" do
  version "1.0.6"
  sha256 "3f6238ff3891f3a0e411174345dd2f6eebafc329856118b00636b8f3549812ab"

  url "https://github.com/apexgang/jet/releases/download/swift-v1.0.6/jet-app-1.0.6.dmg"
  name "Jet"
  desc "Native workspace for Jet coding agent conversations"
  homepage "https://github.com/apexgang/jet"

  depends_on macos: :tahoe
  depends_on formula: "apexgang/tap/jet"

  app "jet.app"
end
