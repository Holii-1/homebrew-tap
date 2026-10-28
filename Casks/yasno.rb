cask "yasno" do
  version "2.0.0"
  sha256 "b9fd41698120cd38a318954b163c2d0ea29040d480f413674e12dba399009178"

  url "https://github.com/Holii-1/YasnoWidget/releases/download/v#{version}/Yasno.zip"
  name "Yasno"
  desc "Native macOS Menu Bar & Desktop Widget for Yasno / DTEK power outage schedules"
  homepage "https://github.com/Holii-1/YasnoWidget"

  depends_on macos: ">= :sonoma"

  app "Yasno.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Yasno.app"],
                   sudo: false
    system_command "/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister",
                   args: ["-f", "#{appdir}/Yasno.app"],
                   sudo: false
    system_command "/usr/bin/pluginkit",
                   args: ["-a", "#{appdir}/Yasno.app/Contents/PlugIns/YasnoWidgetExtension.appex"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Scripts/group.ua.yasno.mac.widget",
    "~/Library/Group Containers/group.ua.yasno.mac.widget",
    "~/Library/Preferences/ua.yasno.mac.widget.plist",
  ]
end
