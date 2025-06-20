class GitGet < Formula
  desc "Opinionated git extension that helps you keep your code folder in order"
  homepage "https://github.com/stilvoid/git-get"
  url "https://github.com/stilvoid/git-get/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "59579d82cb6d184d1c9b030c3dcb9ab35b22e3ddd8e55433e7ccb67eb53e4e4c"
  license "MIT"

  def install
    bin.install "git-get"
    man1.install "git-get.1"
  end

  test do
    assert_equal "Usage: git get <repository>", shell_output("#{bin}/git-get -h").lines.first.strip
  end
end
