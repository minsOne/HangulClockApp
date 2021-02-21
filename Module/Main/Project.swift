import ProjectDescription
import ProjectDescriptionHelpers

let project: Project =
    .staticFramework(name: "Main",
                     packages: [.resouce, .umbrella],
                     platform: .iOS,
                     dependencies: [.FoundationExtension,
                                    .HangulClockTable,
                                    .Umbrella,
                                    .Settings
                     ])
