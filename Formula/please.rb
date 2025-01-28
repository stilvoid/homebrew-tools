class Please < Formula
  desc "Command-line tool for manipulating structured data and working with web APIs"
  homepage "https://github.com/stilvoid/please"
  url "https://github.com/stilvoid/please/archive/refs/tags/v2.0.0.tar.gz"
  sha256 "2c1bf73695a71865d9ef85b191af18dab465396b7582c9e183bb0c5b436a35dc"
  license "GPL-3.0-or-later"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X github.com/stilvoid/please/internal.Version=#{version}")
  end

  test do
    assert_equal "foo: bar", shell_output("echo '{\"foo\":\"bar\"}' | #{bin}/please parse -t yaml").strip
  end
end
