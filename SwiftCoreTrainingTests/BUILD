
load("@build_bazel_rules_apple//apple:ios.bzl",
    "ios_application",
    "ios_unit_test",
    "ios_ui_test",
)

load("@build_bazel_rules_swift//swift:swift.bzl", 
"swift_library",
)

# Unit testing

swift_library(
    name = "SwiftCoreTrainingTests",
    srcs = glob(["**/*.swift"]),   
    visibility = ["//visibility:public"],
)

ios_unit_test(
    name = "SwiftCoreTraining_Unit_Test",
    minimum_os_version = "13.0",
    test_host = ":SwiftCoreTraining",
    infoplists = [
        ":Info.plist"
    ],
    deps = [":SwiftCoreTrainingTests"],
)
