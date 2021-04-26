licenses(["notice"])

filegroup(
    name = "AppIcon",
    srcs = select({
        "//config:develop": glob(["AppIcons.xcassets/AppIcon.appiconset/**"]),
        "//config:production": glob(["AppIcons.xcassets/AppIcon.appiconset/**"]),
        "//conditions:default": glob(["AppIcons.xcassets/AppIcon.appiconset/**"]),
    }),
    visibility = ["//visibility:public"],
)

filegroup(
    name = "Images",
    srcs = glob([
        "**/*",
    ],
    exclude = [
        "AppIcons.xcassets/*.appiconset/**",
    ]),
    visibility = ["//visibility:public"],
)