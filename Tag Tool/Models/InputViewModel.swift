//
//  Brains.swift
//  Tag Tool
//
//  Created by Gary Moore on 26/03/2018.
//  Copyright © 2018 Gary Moore. All rights reserved.
//

import Foundation

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

    // This function is too big, and what it does is rediculous
    static func tagToolExecute(path: String, colFrom: String, colTo: String,
                               tag: String, replace: String, type: String,
                               output: String) -> String {
        var transactionTypeTable: [String : (String) -> String] = [
            "ap" : {(x) -> String in
                return x + (", " + replace)
            },
            
            "er" : {(x) -> String in
                return replace
            }
        ]
        
        let transFunction: (String) -> String = transactionTypeTable[type]!
        
        let optionalHeader = getHeaderFromCsv(csvPath: path);
        let header = optionalHeader != nil ? optionalHeader : Array<String>()
        
        do {
            let fileStream = try String.init(contentsOfFile: path)
            let rows = fileStream.components(separatedBy: .newlines)
            let splitRows = rows.split(separator: ",")
            var rowDict: [String : Array<Substring>] = [:]
            for row in rows {
               
            }
        } catch {
            print(error)
        }
        return ""
    }
}
