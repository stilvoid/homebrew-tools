class GitGet < Formula
  desc "Opinionated git extension that helps you keep your code folder in order"
  homepage "https://github.com/stilvoid/git-get"
  url "https://github.com/stilvoid/git-get/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "644a393041b4d70f97c544003bda805f59d81ac8a306df05605366f2f7e6edfc"
  license "MIT"

  def install
    bin.install "git-get"
    man1.install "git-get.1"
  end

  test do
    assert_equal "Usage: git get <repository>", shell_output("#{bin}/git-get -h").lines.first.strip
  end
end
