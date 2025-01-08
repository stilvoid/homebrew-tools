#                https://rubydoc.brew.sh/Formula
class RetroSort < Formula
  desc "Command-line tool to sort files into a folder layout for use with retro hardware"
  homepage "https://github.com/stilvoid/retro-sort"
  url "https://github.com/stilvoid/retro-sort/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "d7be8dbbe0f100ce7196aec0e91ffe0f2a955fe89fbe4810488f03d9f9d09a45"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/retro-sort"
  end

  test do
    (testpath/"aargh.dsk").write "aargh"
    (testpath/"batman.dsk").write "batman"
    (testpath/"biggles.dsk").write "biggles"
    (testpath/"castmas.dsk").write "castmas"

    expected = <<~EOF
      aargh.dsk\t->\ta/aargh.dsk
      batman.dsk\t->\tb/batman.dsk
      biggles.dsk\t->\tb/biggles.dsk
      castmas.dsk\t->\tc/castmas.dsk
    EOF

    assert_equal expected.strip, shell_output("#{bin}/retro-sort -s 2 -g '*.dsk' -n . out").strip
  end
end
