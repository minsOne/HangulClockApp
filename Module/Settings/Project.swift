import ProjectDescription
import ProjectDescriptionHelpers

let project: Project =
    .staticFramework(name: "Settings",
                     packages: [.resouce],
                     platform: .iOS,
                     dependencies: [.Resource, .AnalyticsKit])
