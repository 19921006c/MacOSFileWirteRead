//
//  ViewController.swift
//  MacOSFileWriteAndRead
//
//  Created by chousigou on 2019/09/19.
//  Copyright © 2019 chousigou. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let manager = FileManager.default
        let url = manager.urls(for: .desktopDirectory, in: .userDomainMask).first
        if let url = url {
            self.createFile("hello world.txt", url: url)
        }
    }
    
    private func createFile(_ name: String, url: URL) {
        let manager = FileManager.default
        let file = url.appendingPathComponent(name)
        let exist = manager.fileExists(atPath: file.path)
        if !exist {
            let data = Data(base64Encoded: "hello, world", options: .ignoreUnknownCharacters)
            let result = manager.createFile(atPath: file.path, contents: data, attributes: nil)
            print("結果 \(result)")
        }
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

