
load("@build_bazel_rules_apple//apple:ios.bzl",
    "ios_application",
)

load("@build_bazel_rules_swift//swift:swift.bzl", 
"swift_library",
)

objc_library(
    name = "SwiftCoreTraining_ObjC",
    hdrs = glob(["SwiftCoreTraining/UserStory/ObjcUsageInSwift/*.h"]),
    srcs = glob(["SwiftCoreTraining/UserStory/ObjcUsageInSwift/*.m"]),
    includes = ["SwiftCoreTraining/UserStory/ObjcUsageInSwift/**/"],
    visibility = ["//visibility:public"],
)

swift_library(
    name = "SwiftCoreTraining_Swift",
    srcs = glob(["SwiftCoreTraining/**/*.swift"]),
    swiftc_inputs = [":SwiftCoreTraining/SwiftCoreTraining-Bridging-Header.h"],
    copts = ["-import-objc-header", "$(location :SwiftCoreTraining/SwiftCoreTraining-Bridging-Header.h)"],
    visibility = ["//visibility:public"],
    deps = [":SwiftCoreTraining_ObjC"]
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
    launch_storyboard = ":SwiftCoreTraining/Resources/LaunchScreen/LaunchScreen.storyboard",
    visibility = ["//visibility:public"],
    deps = [":SwiftCoreTraining_ObjC", ":SwiftCoreTraining_Swift"],
)