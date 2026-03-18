class SttTui < Formula
  desc "Terminal speech-to-text interface powered by OpenAI"
  homepage "https://github.com/wbrijesh/stt-tui"
  url "https://github.com/wbrijesh/stt-tui.git", tag: "v0.1.0"
  license "MIT"
  head "https://github.com/wbrijesh/stt-tui.git", branch: "master"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "stt-tui", shell_output("#{bin}/stt-tui --help 2>&1", 1)
  end
end
