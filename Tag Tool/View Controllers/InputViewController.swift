//
//  InputViewController.swift
//  Tag Tool
//
//  Created by Gary Moore on 26/03/2018.
//  Copyright © 2018 Gary Moore. All rights reserved.
//

import Cocoa

class InputViewController: NSViewController {
    @IBOutlet weak var csvPath: NSTextField!
    @IBOutlet weak var searchTextField: NSTextField!
    @IBOutlet weak var replaceTextField: NSTextField!
    @IBOutlet weak var fromPopUp: NSPopUpButton!
    @IBOutlet weak var toPopUp: NSPopUpButton!
    @IBOutlet weak var typePopUp: NSPopUpButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Depopulate from and to pop ups
        fromPopUp.removeAllItems()
        toPopUp.removeAllItems()
        
        // Set appropriate strings for type pop up
        typePopUp.removeAllItems()
        typePopUp.addItem(withTitle: "Append")
        typePopUp.addItem(withTitle: "Replace")
    }
    
    @IBAction func openFileClick(_ sender: NSButton) {
        // Get file path using NSOpenPanel and set label with same value
        let optionalFilePath = getFilePathWithOpenPanel()
        csvPath.stringValue = optionalFilePath != nil ? optionalFilePath! : ""
        // Get header from the csv
        let optionalHeader = InputViewModel.getHeaderFromCsv(
            csvPath: csvPath.stringValue)
        let header = optionalHeader != nil ? optionalHeader! : Array<String>()
        // Populate 2 lists in UI using header from list
        for heading in header {
            fromPopUp.addItem(withTitle: String(heading))
            toPopUp.addItem(withTitle: String(heading))
        }
    }
    
    @IBAction func submitClick(_ sender: NSButton) {
    }
    
    func getFilePathWithOpenPanel() -> String? {
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
}
