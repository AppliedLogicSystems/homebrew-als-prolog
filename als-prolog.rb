# -*- coding: utf-8 -*-

# To Update:
# Adjust URL to point at new tarball
# Recalculate tarball SHA256 with: shasum -a 256 vX.Y.Z.tar.gz
# E.g., can use:
# curl -L https://github.com/AppliedLogicSystems/ALSProlog/archive/v3.4.1.tar.gz | shasum -a 256

class AlsProlog < Formula
  desc "ALS Prolog Compiler & Development Environment"
  homepage "https://alsprolog.com"
  head "https://github.com/AppliedLogicSystems/ALSProlog.git"
  url "https://github.com/AppliedLogicSystems/ALSProlog/archive/v3.5.0.tar.gz"
  sha256 "aef62d7bb820d89caff52298ed21db74b5e20542853f166a7a237a1e711fcc6c"

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
      doc.install prefix/"als-prolog/als_help.html"
      doc.install prefix/"als-prolog/alshelp.css"
      doc.install prefix/"als-prolog/alshelp"
      doc.install prefix/"als-prolog/package_nav.html"
      doc.install prefix/"als-prolog/examples"

      ohai "\033[7m#{Tty.blue}⊢#{Tty.reset} #{Tty.underline}ALS Prolog: Infer Different!#{Tty.reset}"
    end
  end

  test do
    system "#{bin}/alspro", "--help"
  end
end
