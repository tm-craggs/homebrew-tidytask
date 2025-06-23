class Tidytask < Formula
  desc "A simple CLI tool for managing your to-do list"
  homepage "https://github.com/tm-craggs/tidytask"
  url "1d557bea7d4a71ddf9c004217acffee800bede4bdfc137829d96bc32ed46bd96"
  sha256 ""
  license "GPL-3.0"

  depends_on "go" => :build
  depends_on "sqlite"

  def install
    ENV["CGO_ENABLED"] = "1"
    ENV["GO111MODULE"] = "on"
    system "go", "build", *std_go_args(ldflags: "-s -w"), "."
    chmod "+x", bin/"tidytask"
  end

  test do
    assert_match "tidytask", shell_output("#{bin}/tidytask --help")
  end
end
