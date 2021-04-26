
load("@build_bazel_rules_apple//apple:ios.bzl",
    "ios_application",
    "ios_unit_test",
    "ios_ui_test",
)

load("@build_bazel_rules_swift//swift:swift.bzl", 
"swift_library",
)

# Main app code

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
    copts = ["-import-objc-header", "$(location :SwiftCoreTraining/SwiftCoreTraining-Bridging-Header.h)",],
    visibility = ["//visibility:public"],
    deps = [":SwiftCoreTraining_ObjC"]
)

ios_application(
    name = "SwiftCoreTraining",
    bundle_id = "com.serglam.SwiftCoreTraining",
    bundle_name = "SwiftCoreTraining",
    families = [
        "iphone",
        "ipad",
    ],
    minimum_os_version = "13.0",

    app_icons = [
        "//SwiftCoreTraining/Resources/Images:AppIcon",
    ],
    resources = [
        "//SwiftCoreTraining/Resources/Images:Images",
    ],

    infoplists = [":SwiftCoreTraining/BundleFiles/Plist/Info.plist"],
    launch_storyboard = ":SwiftCoreTraining/Resources/LaunchScreen/LaunchScreen.storyboard",
    strings = [":SwiftCoreTraining/Resources/Localization/en.lproj/Localizable.strings"],

    visibility = ["//visibility:public"],
    deps = [
        ":SwiftCoreTraining_ObjC", 
        ":SwiftCoreTraining_Swift",
    ],
)

# Unit testing

swift_library(
    name = "SwiftCoreTrainingTests",
    srcs = glob(["SwiftCoreTrainingTests/**/*.swift"]),   
    visibility = ["//visibility:public"],
)

ios_unit_test(
    name = "SwiftCoreTraining_Unit_Test",
    minimum_os_version = "13.0",
    test_host = ":SwiftCoreTraining",
    infoplists = [
        ":SwiftCoreTrainingTests/Info.plist"
    ],
    deps = [":SwiftCoreTrainingTests"],
)

# UI testing

swift_library(
    name = "SwiftCoreTrainingUITests",
    srcs = glob(["SwiftCoreTrainingUITests/**/*.swift"]),   
    visibility = ["//visibility:public"],
)

ios_ui_test(
    name = "SwiftCoreTraining_UI_Test",
    minimum_os_version = "13.0",
    test_host = ":SwiftCoreTraining",
    infoplists = [
        ":SwiftCoreTrainingUITests/Info.plist"
    ],
    deps = [":SwiftCoreTrainingUITests"],
)