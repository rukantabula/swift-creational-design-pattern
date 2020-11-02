//
//  ViewController.swift
//  ApSettings
//
//  Created by Benson Rukantabula on 29/10/2020.
//  Copyright © 2020 Benson Rukantabula. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let count = 100
        
        for index in 0..<count {
            AppSettings.shared.set(value: index, forKey: String(index))
        }
        
        DispatchQueue.concurrentPerform(iterations: count){(index) in
            if let n = AppSettings.shared.object(forKey: String(index)) as? Int {
                print(n)
            }
        }
        
        
        AppSettings.shared.reset()
        
        DispatchQueue.concurrentPerform(iterations: count){(index) in
            print("Iteration index \(index)")
            AppSettings.shared.set(value: index, forKey: String(index))
            
        }
    }
    
}

