//
//  Brains.swift
//  Tag Tool
//
//  Created by Gary Moore on 26/03/2018.
//  Copyright © 2018 Gary Moore. All rights reserved.
//

import Foundation
import AppKit

struct InputViewModel {
    static func getHeaderFromCsv(csvPath: String) -> [String]? {
        do {
            let fileStream = try String.init(
                contentsOfFile: csvPath)
            let row = fileStream.components(separatedBy: .newlines)
            let header = row[0].split(separator: ",")
            var headerStringArray = Array<String>()
            for subsequence in header {
                headerStringArray.append(String(subsequence))
            }
            return headerStringArray
        } catch {
            print(error)
            return nil
        }
    }
    
    static func getFilePathWithOpenPanel() -> String? {
        // Use NSOpenPanel to get file path
        let openFile = AppKit.NSOpenPanel()
        openFile.allowsMultipleSelection = false
        openFile.canChooseDirectories = false
        openFile.canChooseFiles = true
        openFile.allowedFileTypes = ["csv"]
        let i = openFile.runModal()
        
        if (i == .OK) {
            return openFile.url!.path
        } else {
            return nil
        }
    }
    
    static func invokeTaggerProcess(Path: String, From: String, To: String,
                                    Tag: String, OperationType: String,
                                    WriteLocation: String) -> String {
        let scriptPath = Bundle.main.bundlePath + "Scripts/workingTagger.pi"
        let arguments  = [scriptPath,
                          Path,
                          From,
                          To,
                          Tag,
                          OperationType,
                          WriteLocation]
        let taggerTask = Process()
        let taggerPipe = Pipe()
        
        taggerTask.arguments = arguments
        taggerTask.standardOutput = taggerPipe
        taggerTask.launchPath = "/usr/local/bin/Python3.6"
        taggerTask.launch()
        taggerTask.waitUntilExit()
    }
}
