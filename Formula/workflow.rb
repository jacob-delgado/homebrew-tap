# Written by scripts/release/package-manifests.sh in jacob-delgado/workflow
# for each release; an edit here is lost at the next one.
class Workflow < Formula
  desc "Run your Jira, Git forge and messaging workflow, in the terminal or a browser"
  homepage "https://github.com/jacob-delgado/workflow"
  if OS.mac?
    url "https://github.com/jacob-delgado/workflow/releases/download/v0.11.0/workflow_darwin_arm64"
    sha256 "b88145e618955d75bba45850646625b859bac4693ac397b03884768b83782a3e"
  else
    url "https://github.com/jacob-delgado/workflow/releases/download/v0.11.0/workflow_linux_amd64"
    sha256 "1d89388c83d98cfec5336c9ecfefd9a25cf37c817ca62d127a1cf8d198e6be9a"
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
