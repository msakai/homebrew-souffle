class Souffle < Formula
  desc "Translator of declarative Datalog programs into the C++ language."
  homepage "https://github.com/souffle-lang/souffle/wiki"
  stable do
    url "https://dl.bintray.com/souffle-lang/osx/souffle-2.0.0.tar.gz"
    sha256 "71106c3d04468ed7aba0352a81dc3c8ae14c471addad24fcf425ff3a1c0715fd"
  end
  head "https://github.com/souffle-lang/souffle.git", :shallow => false

  depends_on "libtool" => :build
  depends_on "bison" => :build
  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libffi" => :build
  depends_on "mcpp"
  depends_on "pkg-config" => :build

  def install
    if build.head?
      system "git", "fetch", "--tags"
      system "./bootstrap"
    end

    system "./configure", "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "false"
  end
end
