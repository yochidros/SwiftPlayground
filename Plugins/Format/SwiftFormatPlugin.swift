//
//  SwiftFormatPlugin.swift
//  
//
//  Created by yochidros on 2023/02/05.
//

import Foundation
import PackagePlugin

@main
struct FormatPlugin: BuildToolPlugin {
    func createBuildCommands(context: PluginContext, target: Target) async throws -> [Command] {
        let tool = try context.tool(named: "swift-format")
        print(tool)
        return [.buildCommand(displayName: nil, executable: tool.path, arguments: [])]
    }
}
