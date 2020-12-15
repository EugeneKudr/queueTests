//
//  ViewController.swift
//  queueTest
//
//  Created by Евгений Испольнов on 14.12.2020.
//

import UIKit

class ViewController: UIViewController {
    
    var value: String?
    var value2: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        /// Использование DispatchGroup для ожидания выполнения
        let group = DispatchGroup()
        
        DispatchQueue.global().async(group: group) {
            sleep(5)
            self.value = "Initialized"
        }
                
        group.notify(queue: .main) {
            print(self.value ?? "Not initialized")
        }
        
        ///Использование semaphore для ожидания выполнения
        let semaphore = DispatchSemaphore(value: 0)
        
        DispatchQueue.global().async {
            sleep(5)
            self.value2 = "2 Initialized"
            semaphore.signal()
        }
                
        semaphore.wait(timeout: .distantFuture)
        
        print(value2 ?? "2 Not initialized")
    
    }

}

