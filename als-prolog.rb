require "formula"

class AlsProlog < Formula
  homepage "http://alsprolog.com"
  head "http://dev.alsprolog.com/als_prolog/trunk", :using => :svn

  def install

    ENV.m32
    ENV.deparallelize
    ENV.O0

    cd "unix" do

      system "make standard"
      system "tar xzf als-prolog-darwin.tgz -C #{prefix}"

      bin.install_symlink prefix/"als-prolog/alspro"
      bin.install_symlink prefix/"als-prolog/alsdev"
      lib.install_symlink prefix/"als-prolog/libalspro.dylib"
      lib.install_symlink prefix/"als-prolog/libalspro.a"
      include.install_symlink prefix/"als-prolog/ALS_Prolog_Foreign_SDK/include/alspi.h"
      include.install_symlink prefix/"als-prolog/ALS_Prolog_Foreign_SDK/include/alspi_slib.h"
      doc.install_symlink prefix/"als-prolog/als-prolog-manual.pdf"

      ohai "\033[7m#{Tty.blue}⊢#{Tty.reset}#{Tty.white} #{Tty.em}ALS Prolog: Infer Different!"
	end
  end
end
