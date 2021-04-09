load("@build_bazel_rules_apple//apple:ios.bzl", "ios_application")

ios_application(
    name = "SwiftCoreTraining",
    bundle_id = "com.serglam.swift-core-training",
    families = [
        "iphone",
        "ipad",
    ],
    minimum_os_version = "11.0",
    infoplists = [":SwiftCoreTraining/BundleFiles/Info.plist"],
    visibility = ["//visibility:public"],
    deps = [":Sources"],
)
