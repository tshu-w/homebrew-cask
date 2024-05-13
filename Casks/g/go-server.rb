cask "go-server" do
  arch arm: "-aarch64"

  version "24.1.0,18867"
  sha256 arm:   "502c50e1d1bc18177b55c7205c40a61b655e58b149fb65bdb0ad4a3c255a8b5f",
         intel: "84e884b841e22956cb9ca58fcaefce0900c6d68b8c1ab9954b21f81eddbf8b55"

  url "https://download.gocd.org/binaries/#{version.csv.first}-#{version.csv.second}/osx/go-server-#{version.csv.first}-#{version.csv.second}-osx#{arch}.zip"
  name "Go Server"
  name "GoCD Server"
  desc "Server for the Go Continuous Delivery platform"
  homepage "https://www.gocd.org/"

  livecheck do
    url "https://download.gocd.org/releases.json"
    regex(/go[._-]server[._-]v?(\d+(?:\.\d+)+)[._-](\d+)[._-]osx\.zip/i)
    strategy :page_match do |page, regex|
      page.scan(regex).map { |match| "#{match[0]},#{match[1]}" }
    end
  end

  binary "go-server-#{version.csv.first}/bin/go-server"

  # No zap stanza required
end
