# Written by scripts/release/package-manifests.sh in jacob-delgado/workflow
# for each release; an edit here is lost at the next one.
class Workflow < Formula
  desc "Run your Jira, Git forge and messaging workflow, in the terminal or a browser"
  homepage "https://github.com/jacob-delgado/workflow"
  if OS.mac?
    url "https://github.com/jacob-delgado/workflow/releases/download/v0.13.1/workflow_darwin_arm64"
    sha256 "cd7c4e6b6eaa5ea1c542a1ccff1bb3bd5c86714dab526f27751a3e64cfe140d0"
  else
    url "https://github.com/jacob-delgado/workflow/releases/download/v0.13.1/workflow_linux_amd64"
    sha256 "45900293652a65230a215922b55c9b5198911f7178dc59662c3f95996d288b6d"
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
