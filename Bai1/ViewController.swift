//
//  ViewController.swift
//  Bai1
//
//  Created by Cntt05 on 7/5/17.
//  Copyright © 2017 Cntt05. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var inactiveQueue: DispatchQueue!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        

         concurrentQueues()
         /*if let queue = inactiveQueue {
         queue.activate()
         }*/
        
    }
    
    func concurrentQueues() {
        
         let anotherQueue = DispatchQueue(label: "com.appcoda.anotherQueue", qos: .utility, attributes: .concurrent)
        
        /*let anotherQueue = DispatchQueue(label: "com.appcoda.anotherQueue", qos: .userInitiated, attributes: [.concurrent, .initiallyInactive])
        inactiveQueue = anotherQueue*/
        
        anotherQueue.async {
            for i in 0..<10 {
                print("🔴", i)
            }
        }
        
        
        anotherQueue.async {
            for i in 100..<110 {
                print("🔵", i)
            }
        }
        
        
        anotherQueue.async {
            for i in 1000..<1010 {
                print("⚫️", i)
            }
        }
    }

}

