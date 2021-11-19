# -*- coding: utf-8 -*-

# Note: This experimental formula conficts with default formula,
#       so be sure to uninstall and untap als-prolog formula before installing.

# Install with:
#     brew install -v --HEAD AppliedLogicSystems/als-prolog/als-prolog-64

class AlsProlog64 < Formula
  desc "ALS Prolog Compiler & Development Environment"
  homepage "https://alsprolog.com"
  head "https://github.com/AppliedLogicSystems/ALSProlog.git", branch: "als64"

  def install

    # Remove Hombrew header/lib paths to avoid interference from /usr/local headers
    # and libs, in particular 3rd party Tcl/Tk headers.
    ENV.delete("HOMEBREW_ISYSTEM_PATHS")
    ENV.delete("HOMEBREW_LIBRARY_PATHS")

    ENV["BUNDLE_PATH"] = "_vendor/bundle"
    
    cd "unix" do
      platform = `uname`.strip.downcase

      system "make", "standard"
      system "tar", "xzf", "als-prolog-#{platform}.tgz", "-C", prefix

      bin.install_symlink prefix/"als-prolog/alspro"
      bin.install_symlink prefix/"als-prolog/alsdev"
      lib.install_symlink prefix/"als-prolog/libalspro.dylib"
      lib.install_symlink prefix/"als-prolog/libalspro.a"
      include.install_symlink prefix/"als-prolog/ALS_Prolog_Foreign_SDK/include/alspi.h"
      include.install_symlink prefix/"als-prolog/ALS_Prolog_Foreign_SDK/include/alspi_slib.h"
      man1.install prefix/"als-prolog/alspro.1"
      doc.install prefix/"als-prolog/LICENSE.txt"
      doc.install prefix/"als-prolog/README.txt"
      doc.install prefix/"als-prolog/als-prolog-manual.pdf"
      doc.install prefix/"als-prolog/als-ref-manual.pdf"
      doc.install prefix/"als-prolog/docs"
      doc.install prefix/"als-prolog/examples"

      ohai "\033[7m#{Tty.blue}⊢#{Tty.reset} #{Tty.underline}ALS Prolog: Infer Different!#{Tty.reset}"
    end
  end

  test do
    system "#{bin}/alspro", "--help"
  end
end
