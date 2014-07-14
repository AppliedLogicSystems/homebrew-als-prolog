require "formula"

class AlsProlog < Formula
  homepage "http://alsprolog.com"
  head "http://dev.alsprolog.com/als_prolog/trunk", :using => :svn

  def install

    ENV.m32
    ENV.deparallelize
    ENV.O0

    cd "core/unix/darwin" do

      system "make alspro"

      bin.install "alspro"

      # Install the alsdir via cp in order to deref symlinks
      system "cp", "-RL", "alsdir", bin/"alsdir"

      # Adjust OBP times by 61 seconds, so alspro doesn't try to regen
      system "touch -A 000101 #{bin}/alsdir/builtins/*.obp"

      ohai "\033[7m#{Tty.blue}⊢#{Tty.reset}#{Tty.white} #{Tty.em}ALS Prolog: Infer Different!"
	end
  end
end
