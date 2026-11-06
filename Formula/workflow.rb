# Written by scripts/release/package-manifests.sh in jacob-delgado/workflow
# for each release; an edit here is lost at the next one.
class Workflow < Formula
  desc "Run your Jira, Git forge and messaging workflow, in the terminal or a browser"
  homepage "https://github.com/jacob-delgado/workflow"
  if OS.mac?
    url "https://github.com/jacob-delgado/workflow/releases/download/v0.13.3/workflow_darwin_arm64"
    sha256 "eaa5b41b1f24edb1925edf32a09d185c3919cfb07ff71f3433a0966833a767c8"
  else
    url "https://github.com/jacob-delgado/workflow/releases/download/v0.13.3/workflow_linux_amd64"
    sha256 "862b6fb5a99525863aad062004db3d312873169932692d32dd5d93716f035adb"
  end
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    depends_on arch: :x86_64
  end

  def install
    bin.install Dir["workflow_*"].first => "workflow"
    chmod 0755, bin/"workflow"
    generate_completions_from_executable(bin/"workflow", "completion")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/workflow --version")
  end
end
