//
//  ViewController.swift
//  queueTest
//
//  Created by Евгений Испольнов on 14.12.2020.
//

import UIKit

class ViewController: UIViewController {
    
    var value: String?
    
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        let group = DispatchGroup()
        
        DispatchQueue.global().async(group: group) {
            self.value = "Initialized"
        }
        
        group.notify(queue: .main) {
            self.firstLabel.text = self.value
        }
        
        secondLabel.text = value
        
    }

}

