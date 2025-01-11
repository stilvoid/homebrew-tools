class Please < Formula
  desc "Command-line tool for manipulating structured data and working with web APIs"
  homepage "https://github.com/stilvoid/please"
  url "https://github.com/stilvoid/please/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "1a6d53ca0ac65b9fb1b81058b7974d65da43ae8ad519294e4d36e7261223e04b"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    assert_equal "foo: bar", shell_output("echo '{\"foo\":\"bar\"}' | #{bin}/please parse -o yaml").strip
  end
end
