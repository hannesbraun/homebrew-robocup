class MagmaFatProxy < Formula
  desc "Fat Proxy for RoboCup 3D Soccer Simulation"
  homepage "https://github.com/magmaOffenburg/magmaFatProxy"
  url "https://github.com/magmaOffenburg/magmaFatProxy/archive/v1.0.0.tar.gz"
  sha256 "f10559bcba02ff16509ee0a99275d7c08a51b8062ef90986b3aeae8c72aa3b5d"
  license "GPL-3.0"
  head "https://github.com/magmaOffenburg/magmaFatProxy.git"

  depends_on "ant" => :build
  depends_on :java => "1.8"

  def install
    system "ant", "-f", "magmaFatProxy.xml", "jar"
    libexec.install "jar/magmaFatProxy.jar"
    libexec.install "scripts/start.sh"
    mv libexec/"start.sh", libexec/"magma-fat-proxy"
    # Workaround to make the start script executable; can be removed as soon as the shebang is added at the right position
    FileUtils.chmod 0775, libexec/"magma-fat-proxy"
    bin.write_exec_script libexec/"magma-fat-proxy"
  end
end
