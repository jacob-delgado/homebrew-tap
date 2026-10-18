# Written by scripts/release/package-manifests.sh in jacob-delgado/workflow
# for each release; an edit here is lost at the next one.
class Workflow < Formula
  desc "Run your Jira, Git forge and messaging workflow, in the terminal or a browser"
  homepage "https://github.com/jacob-delgado/workflow"
  if OS.mac?
    url "https://github.com/jacob-delgado/workflow/releases/download/v0.12.0/workflow_darwin_arm64"
    sha256 "56bc7455cd828bec9d07876e68179b2de5b8de317bcabac2995fac549c83ea8a"
  else
    url "https://github.com/jacob-delgado/workflow/releases/download/v0.12.0/workflow_linux_amd64"
    sha256 "8572cc73f2ebb3aa151ed2c794e5878b616eb1999413b0da92cc3b61d94dd736"
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
