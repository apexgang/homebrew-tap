class Jet < Formula
  desc "Run and manage coding agent conversations across machines"
  homepage "https://github.com/apexgang/jet"
  version "0.2.0"
  license "Apache-2.0"
  depends_on :macos

  on_macos do
    url "https://github.com/apexgang/jet/releases/download/swift-v1.0.4/jet-core-0.2.0-universal-apple-darwin.tar.gz"
    sha256 "338fc1a5df36e0cd8d2a871d9639405554c84bc80de49cc9ad5e7085f5a9ed2f"
  end

  def install
    service_path = "#{HOMEBREW_PREFIX}/bin:#{HOMEBREW_PREFIX}/sbin:/usr/bin:/bin:/usr/sbin:/sbin"
    libexec.install "jetd", "jetfueld", "jet-craft-claude", "jet-craft-codex", "manifest.json"
    bin.install_symlink libexec/"jetd", libexec/"jetfueld", libexec/"jet-craft-claude", libexec/"jet-craft-codex"
    # Helpers must survive brew services stop/restart, just as they survive a
    # GUI-managed daemon restart. Homebrew's generated units kill the group.
    (prefix/"com.apexgang.jet.homebrew.plist").write <<~PLIST
      <?xml version="1.0" encoding="UTF-8"?>
      <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
      <plist version="1.0"><dict>
        <key>Label</key><string>com.apexgang.jet.homebrew</string>
        <key>ProgramArguments</key><array>
          <string>#{opt_bin}/jetd</string><string>serve</string>
          <string>--channel</string><string>homebrew</string>
        </array>
        <key>EnvironmentVariables</key><dict><key>PATH</key><string>#{service_path}</string></dict>
        <key>RunAtLoad</key><true/>
        <key>KeepAlive</key><true/>
        <key>AbandonProcessGroup</key><true/>
        <key>ExitTimeOut</key><integer>15</integer>
      </dict></plist>
    PLIST
    (prefix/"jet-homebrew.service").write <<~SERVICE
      [Unit]
      Description=Jet daemon
      [Service]
      ExecStart=#{opt_bin}/jetd serve --channel homebrew
      Environment="PATH=#{service_path}"
      KillMode=process
      TimeoutStopSec=15
      Restart=always
      RestartSec=2
      [Install]
      WantedBy=default.target
    SERVICE
  end

  service do
    name macos: "com.apexgang.jet.homebrew", linux: "jet-homebrew"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/jetd core describe")
  end
end
