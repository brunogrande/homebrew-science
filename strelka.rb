class Strelka < Formula
  desc "Somatic variant calling workflow for tumor samples"
  homepage "https://sites.google.com/site/strelkasomaticvariantcaller/home"
  url "ftp://strelka:%27%27@ftp.illumina.com/v1-branch/v1.0.14/strelka_workflow-1.0.14.tar.gz"
  sha256 "b3aeca63dfea7787a4046a0ff747e9fe4a267297a3d0ae5126fab890e7152f39"

  # 
  # Needs Python for testing installation
  depends_on :python => :build
  # Needs rsync for installing to #{prefix}
  depends_on "homebrew/dupes/rsync" => :build

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  fails_with :clang do
    build 700
    cause <<-EOS.undent
      The version of samtools redistributed with Strelka fails to compile with
      clang on OS X due to missing symbols. See link for more details:
      https://groups.google.com/d/topic/strelka-discuss/bS3TgY5YfxE/discussion
      EOS
  end

  test do
    # Run demo analysis to test Strelka installation
    system "#{bin}/demo/run_demo.bash"
  end
end
