
load("@build_bazel_rules_apple//apple:ios.bzl", "ios_application")
load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")

swift_library(
    name = "SwiftCoreTraining_Swift",
    srcs = glob(["SwiftCoreTraining/**/*.swift"]) ,
    visibility = ["//visibility:public"],
    deps = ["//Vendor/Eureka:Eureka"],
    # //Vendor/R.swift:R.swift
)

objc_library(
    name = "SwiftCoreTraining_ObjC",
    hdrs = glob(["SwiftCoreTraining/UserStory/ObjcUsageInSwift/*.h"]),
    srcs = glob(["SwiftCoreTraining/UserStory/ObjcUsageInSwift/*.m"]),
    includes = ["SwiftCoreTraining/UserStory/ObjcUsageInSwift/**/"],
    visibility = ["//visibility:public"],
)

ios_application(
    name = "SwiftCoreTraining",
    bundle_id = "com.serglam.SwiftCoreTraining",
    families = [
        "iphone",
        "ipad",
    ],
    minimum_os_version = "13.0",
    infoplists = [":SwiftCoreTraining/BundleFiles/Plist/Info.plist"],
    visibility = ["//visibility:public"],
    deps = [":SwiftCoreTraining_Swift", ":SwiftCoreTraining_ObjC"],
)
