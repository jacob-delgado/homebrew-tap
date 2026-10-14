# Written by scripts/release/package-manifests.sh in jacob-delgado/workflow
# for each release; an edit here is lost at the next one.
class Workflow < Formula
  desc "Run your Jira, Git forge and messaging workflow, in the terminal or a browser"
  homepage "https://github.com/jacob-delgado/workflow"
  if OS.mac?
    url "https://github.com/jacob-delgado/workflow/releases/download/v0.10.0/workflow_darwin_arm64"
    sha256 "05b2c4d9bb366110e57a30428d0572487ace3d3bb52ae9cb64dc67b6f337d7d2"
  else
    url "https://github.com/jacob-delgado/workflow/releases/download/v0.10.0/workflow_linux_amd64"
    sha256 "45bf64e4149c48938c99938fde8c6e7e84def5e6694b594d47c2e480836cd8b0"
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
