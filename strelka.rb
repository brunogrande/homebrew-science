class Strelka < Formula
  desc "Somatic variant calling workflow for matched tumor-normal samples"
  homepage "https://sites.google.com/site/strelkasomaticvariantcaller/home"
  url "ftp://strelka:%27%27@ftp.illumina.com/v1-branch/v1.0.14/strelka_workflow-1.0.14.tar.gz"
  sha256 "b3aeca63dfea7787a4046a0ff747e9fe4a267297a3d0ae5126fab890e7152f39"

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    # Run demo analysis to test Strelka installation
    system "#{bin}/demo/run_demo.bash"
  end
end
