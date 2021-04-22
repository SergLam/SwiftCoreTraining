
load("@build_bazel_rules_apple//apple:ios.bzl",
    "ios_application",
    "ios_framework",
)

load("@build_bazel_rules_swift//swift:swift.bzl", 
"swift_library",
"swift_import"
)

load("//build-system/bazel-utils:plist_fragment.bzl",
    "plist_fragment",
)

swift_library(
    name = "SwiftCoreTraining_Swift",
    srcs = glob(["SwiftCoreTraining/**/*.swift"]),
    visibility = ["//visibility:public"],
    deps = [":Eureka"],
)

swift_library(
    name = "Eureka",
    module_name = "Eureka",
    srcs = glob(
        ["Vendor/Eureka/Eureka-5.3.3/Source/**/*.swift"]
    ),
    visibility = ["//visibility:public"],
    deps = [
      "//Vendor/Eureka:Eureka",
    ],
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
    deps = [":SwiftCoreTraining_ObjC,", ":SwiftCoreTraining_Swift"],
)

plist_fragment(
    name = "MainTargetInfoPlist",
    extension = "plist",
    template =
    """
    <key>CFBundleIdentifier</key>
    <string>com.serglam.SwiftCoreTraining</string>
    <key>CFBundleDevelopmentRegion</key>
    <string>en</string>
    <key>CFBundleName</key>
    <string>Eureka</string>
    <key>CFBundlePackageType</key>
    <string>FMWK</string>
    """
)

plist_fragment(
    name = "EurekaInfoPlist",
    extension = "plist",
    template =
    """
    <key>CFBundleIdentifier</key>
    <string>com.serglam.SwiftCoreTraining.Eureka</string>
    <key>CFBundleDevelopmentRegion</key>
    <string>en</string>
    <key>CFBundleName</key>
    <string>Eureka</string>
    <key>CFBundlePackageType</key>
    <string>FMWK</string>
    """
)

plist_fragment(
    name = "VersionInfoPlist",
    extension = "plist",
    template =
    """
    <key>CFBundleShortVersionString</key>
    <string>1.0</string>
    """
)

plist_fragment(
    name = "AppNameInfoPlist",
    extension = "plist",
    template =
    """
    <key>CFBundleDisplayName</key>
    <string>Swift Core Training</string>
    """
)

plist_fragment(
    name = "BuildNumberInfoPlist",
    extension = "plist",
    template =
    """
    <key>CFBundleVersion</key>
    <string>1</string>
    """
)