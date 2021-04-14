load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

# load("@rules_pods//BazelExtensions:workspace.bzl", "new_pod_repository")

git_repository(
    name = "build_bazel_rules_apple",
    remote = "https://github.com/bazelbuild/rules_apple.git",
    tag = "0.31.1",
)

git_repository(
    name = "build_bazel_rules_swift",
    remote = "https://github.com/bazelbuild/rules_swift.git",
    tag = "0.20.0",
)

git_repository(
    name = "build_bazel_apple_support",
    remote = "https://github.com/bazelbuild/apple_support.git",
    tag = "0.10.0",
)

git_repository(
    name = "bazel_skylib",
    remote = "https://github.com/bazelbuild/bazel-skylib.git",
    tag = "1.0.3",
)

http_archive(
    name = "rules_pods",
    sha256 = "31b3ee6c32c6047008e6820af36573019ac7a25ea421222c638277984e9cde27",
    url = "https://github.com/pinterest/PodToBUILD/releases/download/3.4.1-ea20598f/PodToBUILD.zip",
)

http_archive(
    name = "build_bazel_rules_swift",
    sha256 = "a525d254b0323380b7abe7cbbe03534167f0fcb45f44f7d16cdd4d7d057b8f8d",
    url = "https://github.com/bazelbuild/rules_swift/releases/download/0.20.0/rules_swift.0.20.0.tar.gz",
)

load(
    "@build_bazel_rules_swift//swift:repositories.bzl",
    "swift_rules_dependencies",
)

swift_rules_dependencies()

load(
    "@build_bazel_rules_swift//swift:extras.bzl",
    "swift_rules_extra_dependencies",
)

swift_rules_extra_dependencies()