# Written by scripts/release/package-manifests.sh in jacob-delgado/workflow
# for each release; an edit here is lost at the next one.
class Workflow < Formula
  desc "Run your Jira, Git forge and messaging workflow, in the terminal or a browser"
  homepage "https://github.com/jacob-delgado/workflow"
  if OS.mac?
    url "https://github.com/jacob-delgado/workflow/releases/download/v0.13.2/workflow_darwin_arm64"
    sha256 "7a3c7c85341598a7eda09cf6201c7f5a1ab1fe0318069dac78cc665f1ecb05a0"
  else
    url "https://github.com/jacob-delgado/workflow/releases/download/v0.13.2/workflow_linux_amd64"
    sha256 "56f0adbd62d51efcb41dd333cf494539e366e4d8274d08358387d21d4a5e9d2c"
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
