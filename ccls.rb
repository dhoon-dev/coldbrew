class Ccls < Formula
  desc "C/C++/ObjC language server"
  homepage "https://github.com/MaskRay/ccls"
  url "https://github.com/MaskRay/ccls/archive/0.20201219.tar.gz"
  sha256 "edd3435bc7e55d9e5dc931932f9c98275a6a28d1ab1f66416110e029f3f2882a"
  license "Apache-2.0"
  head "https://github.com/MaskRay/ccls.git"

  depends_on "cmake" => :build
  depends_on "rapidjson" => :build
  depends_on "llvm"
  depends_on macos: :high_sierra # C++ 17 is required

  def install
    system "cmake", "-DCMAKE_PREFIX_PATH=$(brew --prefix)", *std_cmake_args
    system "make", "install"
  end

  test do
    system bin/"ccls", "-index=#{testpath}"
  end
end
