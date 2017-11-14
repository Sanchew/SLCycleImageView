//
//  ViewController.swift
//  SLCycleImageView
//
//  Created by Sanchew on 2017/11/2.
//  Copyright © 2017年 sanchew. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let imagesView = SLCycleImageView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 300))
        
        imagesView.imageURLStringsGroup = [
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQ-0S8lQyOithHu1bEpFDK7KqDFWSZ8ZMl0sUeG0dHbuTiki4lTQ" as AnyObject,
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQyoyBHYZrHweiW4s4-XqcZQ5LlpVc4BdlseJUjA--8KYaaLPUEHA" as AnyObject,
        ]
        
        self.view .addSubview(imagesView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

