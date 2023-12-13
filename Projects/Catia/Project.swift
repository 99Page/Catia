//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 노우영 on 12/13/23.
//

import ProjectDescription

let infoPlist: [String: InfoPlist.Value] = [
    "CFBundleShortVersionString": "1.0",
    "CFBundleVersion": "1",
    "UIMainStoryboardFile": "",
    "UILaunchStoryboardName": "Launch Screen",
    "ITSAppUsesNonExemptEncryption": false
]

let fecitTarget = Target(
    name: "Catia",
    platform: .iOS,
    product: .app,
    bundleId: "com.page",
    infoPlist: .extendingDefault(with: infoPlist),
    sources: ["Sources/**"],
    resources: ["Resources/**"],
    settings: .settings(
        base: [
            // tuist generate를 할 때 자동으로 Team 선택을 할 수 있습니다.
            // 키체인 접근 - 시스템 - Apple development 검색 - 원하는 인증서 선택 - 조직 단위(제목 이름과 함께 있는 영역)의 값을 넣어줍니다.
            "DEVELOPMENT_TEAM": "MAU8HFALP8",
            
            // 타겟이 지원하려는 디바이스를 지정합니다.
            // 1: iPhone
            // 2: iPad
            // 여러개를 지정하려면 "1, 2"처럼 입력합니다.
            "TARGETED_DEVICE_FAMILY": "1"
        ],
        configurations: [],
        defaultSettings: .recommended)
)


let testTarget = Target(
    name: "FecitTests",
    platform: .iOS,
    product: .unitTests,
    bundleId: "com.vaudium.fecit.test",
    sources: ["../Tests/Sources/**"],
    dependencies: [
        .target(name: "Fecit")
    ]
)

let fecitProject = Project(name: "Catia",
                           organizationName: "Page",
                           settings: .settings(
                            base: .init()
                                .marketingVersion("1.0.0"),
                            defaultSettings: .recommended
                           ),
                           targets: [fecitTarget, testTarget]
)



