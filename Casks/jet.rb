cask "jet" do
  version "1.0.4"
  sha256 "37e9ab87d7b8f05c0edd7e5e9f1ae775175e79dc8a261b4f0d7e1e223865cccb"

  url "https://github.com/apexgang/jet/releases/download/swift-v1.0.4/jet-app-1.0.4.dmg"
  name "Jet"
  desc "Native workspace for Jet coding agent conversations"
  homepage "https://github.com/apexgang/jet"

  depends_on macos: :tahoe
  depends_on formula: "apexgang/tap/jet"

  app "jet.app"
end
