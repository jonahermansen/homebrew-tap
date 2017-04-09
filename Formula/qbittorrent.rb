# Documentation: http://docs.brew.sh/Formula-Cookbook.html
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Qbittorrent < Formula
  desc "Free and reliable P2P Bittorrent client"
  homepage "https://www.qbittorrent.org/"
  url "https://sourceforge.net/projects/qbittorrent/files/qbittorrent/qbittorrent-3.3.10/qbittorrent-3.3.10.tar.xz/download"
  version "3.3.10"
  sha256 "2c657ceacdc84033da044a0a9ecba7e0fdb35858324dc097546f989166f1a8d2"

  depends_on "pkg-config" => :build
  depends_on "libtorrent-rasterbar"
  depends_on "openssl"
  depends_on "qt5"

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel

    # Remove unrecognized options if warned by configure
    ENV.append_to_cflags "-I#{Formula["openssl"].opt_prefix}/include"
    ENV.append "CPPFLAGS", "-I#{Formula["openssl"].opt_prefix}/include"
    ENV.append "CPPFLAGS", "-Wno-error=deprecated-declarations"
    ENV.append "QT_QMAKE", "#{Formula["qt5"].opt_prefix}/bin"
    system "./configure", "--disable-gui"
    
    #, "--disable-debug",
     #                     "--disable-dependency-tracking",
      #                    "--disable-silent-rules",
       #                   "--prefix=#{prefix}"
    # system "cmake", ".", *std_cmake_args
    system "make"
    system "make", "install" # if this fails, try separate make/make install steps
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test qbittorrent`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
