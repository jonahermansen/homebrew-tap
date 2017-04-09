class Murmur < Formula
  desc "Server component for Mumble"
  homepage "https://www.mumble.info/"
  url "https://github.com/mumble-voip/mumble/releases/download/1.2.19/Murmur-OSX-Static-1.2.19.tar.bz2"
  sha256 "839a4782f64e6d46e5f63b6b06353eb942bba487ee3cf3f5669d176fef52f57e"

  def install
    bin.install "murmurd"
    etc.install "murmur.ini"
  end

  plist_options :manual => "murmur"

  def plist; <<-EOS.undent
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
    <dict>
        <key>Label</key>
        <string>#{plist_name}</string>
        <key>WorkingDirectory</key>
        <string>#{HOMEBREW_PREFIX}</string>
        <key>ProgramArguments</key>
        <array>
            <string>#{opt_bin}/mpd</string>
            <string>--no-daemon</string>
        </array>
        <key>RunAtLoad</key>
        <true/>
        <key>KeepAlive</key>
        <true/>
    </dict>
    </plist>
    EOS
  end

  test do
    system "#{bin}/murmurd", "-help"
  end
end
