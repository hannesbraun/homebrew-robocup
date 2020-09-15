class MagmaFatProxy < Formula
  desc "Fat Proxy for RoboCup 3D Soccer Simulation"
  homepage "https://github.com/magmaOffenburg/magmaFatProxy"
  url "https://github.com/magmaOffenburg/magmaFatProxy/archive/v1.0.1.tar.gz"
  sha256 "1dbdc1ae8732f41abafe44d56e3aa4a53575b7b8cb28844849948b62ae7a68e7"
  license "GPL-3.0"
  head "https://github.com/magmaOffenburg/magmaFatProxy.git"

  depends_on "ant" => :build
  depends_on java: "1.8"

  def install
    system "ant", "-f", "magmaFatProxy.xml", "jar"
    libexec.install "jar/magmaFatProxy.jar"
    libexec.install "scripts/start.sh"
    mv libexec/"start.sh", libexec/"magma-fat-proxy"
    bin.write_exec_script libexec/"magma-fat-proxy"
  end
end
