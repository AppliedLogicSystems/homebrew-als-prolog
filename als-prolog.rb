# -*- coding: utf-8 -*-
require "formula"

class AlsProlog < Formula
  homepage "http://alsprolog.com"
  head "https://github.com/AppliedLogicSystems/ALSProlog", :using => :git

  def install

    ENV.m32
    ENV.deparallelize
    ENV.O0

    # Remove Hombrew header/lib paths to avoid interference from /usr/local headers
    # and libs, in particular 3rd party Tcl/Tk headers.
	ENV.delete("HOMEBREW_ISYSTEM_PATHS")
	ENV.delete("HOMEBREW_LIBRARY_PATHS")

    cd "unix" do
      platform = `uname`.strip.downcase

      system "make standard"
      system "tar xzf als-prolog-#{platform}.tgz -C #{prefix}"

      bin.install_symlink prefix/"als-prolog/alspro"
      bin.install_symlink prefix/"als-prolog/alsdev"
      lib.install_symlink prefix/"als-prolog/libalspro.dylib"
      lib.install_symlink prefix/"als-prolog/libalspro.a"
      include.install_symlink prefix/"als-prolog/ALS_Prolog_Foreign_SDK/include/alspi.h"
      include.install_symlink prefix/"als-prolog/ALS_Prolog_Foreign_SDK/include/alspi_slib.h"
      doc.install prefix/"als-prolog/als-prolog-manual.pdf"

      ohai "\033[7m#{Tty.blue}⊢#{Tty.reset}#{Tty.white} #{Tty.em}ALS Prolog: Infer Different!"
    end
  end
end
