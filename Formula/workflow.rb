# Written by scripts/release/package-manifests.sh in jacob-delgado/workflow
# for each release; an edit here is lost at the next one.
class Workflow < Formula
  desc "Run your Jira, Git forge and messaging workflow, in the terminal or a browser"
  homepage "https://github.com/jacob-delgado/workflow"
  version "0.9.1"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/jacob-delgado/workflow/releases/download/v0.9.1/workflow_darwin_arm64"
    sha256 "b483be604e38cf1253fb3a596f878822f0a1d1bba8f4321eb92fbafabe87c46a"

    depends_on arch: :arm64
  end

  on_linux do
    url "https://github.com/jacob-delgado/workflow/releases/download/v0.9.1/workflow_linux_amd64"
    sha256 "7ab008fee778b79a87a2d6277276cbd944ed07d8410846956828408032da30b5"

    depends_on arch: :x86_64
  end

  def install
    bin.install Dir["workflow_*"].first => "workflow"
    chmod 0755, bin/"workflow"
    generate_completions_from_executable(bin/"workflow", "completion", shells: [:bash, :zsh, :fish])
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/workflow --version")
  end
end
