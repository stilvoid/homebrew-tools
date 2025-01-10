class Shue < Formula
  desc "Command-line tool to modify and convert colour representations, e.g. hex to rgb"
  homepage "https://github.com/stilvoid/shue"
  url "https://github.com/stilvoid/shue/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "cc2413ff5754b035246a1c8b8ed5a793a933ba7ca5954bda6f9a0480ea094d97"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    assert_equal "rgb(255, 136, 0)", shell_output("#{bin}/shue -f rgb ff8800").strip
  end
end
