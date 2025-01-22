class Shue < Formula
  desc "Command-line tool to modify and convert colour representations, e.g. hex to rgb"
  homepage "https://github.com/stilvoid/shue"
  url "https://github.com/stilvoid/shue/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "f4ae2cae629592a40900ed4419b5be8030855e1b8618084f7db438a7dbb765a2"
  license "GPL-3.0-only"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}"), "./cmd/main.go"
  end

  test do
    assert_equal "rgb(255, 136, 0)", shell_output("#{bin}/shue -f rgb ff8800").strip
  end
end
