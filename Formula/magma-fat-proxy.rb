class MagmaFatProxy < Formula
  desc "Fat Proxy for RoboCup 3D Soccer Simulation"
  homepage "https://github.com/magmaOffenburg/magmaFatProxy"
  url "https://github.com/magmaOffenburg/magmaFatProxy/archive/v1.1.0.tar.gz"
  sha256 "e785ba80ce3adfef85783dbbb9bdb97303324a3e8ccaa80462793dab70fce4ff"
  license "GPL-3.0"
  revision 2
  head "https://github.com/magmaOffenburg/magmaFatProxy.git"

  depends_on "maven" => :build
  depends_on java: "1.8"

  def install
    system "mvn", "package"
    libexec.install "target/magmaFatProxy-#{version}-jar-with-dependencies.jar"
    mv libexec/"magmaFatProxy-#{version}-jar-with-dependencies.jar", libexec/"magmaFatProxy.jar"
    libexec.install "scripts/start.sh"
    mv libexec/"start.sh", libexec/"magma-fat-proxy"
    chmod 0775, libexec/"magma-fat-proxy"
    bin.write_exec_script libexec/"magma-fat-proxy"
  end
end
