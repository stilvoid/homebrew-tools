class Please < Formula
  desc "Command-line tool for manipulating structured data and working with web APIs"
  homepage "https://github.com/stilvoid/please"
  url "https://github.com/stilvoid/please/archive/refs/tags/v2.0.1.tar.gz"
  sha256 "851689e595bb5f6a486a6f973b454c83836c4cbead40be118be9b64e24dc2ffc"
  license "GPL-3.0-or-later"

  deprecate! date: "2026-01-14", because: :deprecated_upstream, replacement_formula: "nushell"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X github.com/stilvoid/please/internal.Version=#{version}")
  end

  test do
    assert_equal "foo: bar", shell_output("echo '{\"foo\":\"bar\"}' | #{bin}/please parse -t yaml").strip
  end
end
