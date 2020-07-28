class Roboviz < Formula
  desc "Visualization tool for the RoboCup 3D Soccer Simulation League"
  homepage "https://github.com/magmaOffenburg/RoboViz"
  url "https://github.com/magmaOffenburg/RoboViz/archive/1.7.0.tar.gz"
  sha256 "fc7aa72384173ecf8fd9a25766d99b945a88296229c23d260b79ff83aca9ceff"
  license "Apache-2.0"
  head "https://github.com/magmaOffenburg/RoboViz.git"

  depends_on "gradle" => :build
  depends_on java: "1.8"

  def install
    system "gradle", "shadowJar"
    libexec.install "viewer/build/libs/RoboViz.jar"
    libexec.install "viewer/config.txt"
    libexec.install "scripts/roboviz.sh"
    libexec.install "scripts/config.sh"
    mv libexec/"roboviz.sh", libexec/"roboviz"
    mv libexec/"config.sh", libexec/"rvconfigure"
    bin.write_exec_script libexec/"roboviz"
    bin.write_exec_script libexec/"rvconfigure"
  end

  def caveats
    <<~EOS
      If the user-specific configuration file ~/.roboviz/config.txt is not available,
      #{libexec}/config.txt will be used.
    EOS
  end
end
