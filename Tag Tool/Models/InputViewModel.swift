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
    
    static func tagTool
}
