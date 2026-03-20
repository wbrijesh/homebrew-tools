class SttTui < Formula
  desc "Terminal speech-to-text interface"
  homepage "https://github.com/wbrijesh/stt-tui"
  url "https://github.com/wbrijesh/stt-tui.git", tag: "v0.3.0"
  license "MIT"
  head "https://github.com/wbrijesh/stt-tui.git", branch: "main"

  depends_on "cmake" => :build
  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "stt-tui", shell_output("#{bin}/stt-tui --help 2>&1", 1)
  end
end
