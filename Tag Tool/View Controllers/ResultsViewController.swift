//
//  ResultsViewController.swift
//  Tag Tool
//
//  Created by Gary Moore on 26/03/2018.
//  Copyright © 2018 Gary Moore. All rights reserved.
//

import Cocoa

class ResultsViewController: NSViewController {
    @IBOutlet weak var terminalOutput: NSTextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    @IBAction func onClearButtonClick(_ sender: NSButton) {
        terminalOutput.textStorage?.setAttributedString(
            NSAttributedString(string: ""))
    }
}
