//
//  ViewController.swift
//  queueTest
//
//  Created by Евгений Испольнов on 14.12.2020.
//

import UIKit

class ViewController: UIViewController {
    
    var value: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        let group = DispatchGroup()
        
        DispatchQueue.global().async(group: group) {
            sleep(5)
            self.value = "Initialized"
        }
                
        group.notify(queue: .main) {
            print(self.value)
        }
    
    }

}

