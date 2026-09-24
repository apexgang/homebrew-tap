cask "jet" do
  version "1.0.5"
  sha256 "541cf6008e1dfaf1790b8229db824e1cab5b9e59e6c1ef49f3ad21cb87897e67"

  url "https://github.com/apexgang/jet/releases/download/swift-v1.0.5/jet-app-1.0.5.dmg"
  name "Jet"
  desc "Native workspace for Jet coding agent conversations"
  homepage "https://github.com/apexgang/jet"

  depends_on macos: :tahoe
  depends_on formula: "apexgang/tap/jet"

  app "jet.app"
end
