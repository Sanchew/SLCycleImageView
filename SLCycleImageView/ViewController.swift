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
        imagesView.autoScroll = false
        imagesView.imageURLStringsGroup = [
            "https://cdnmedia.cemarose.cn/videos/c/o/v/3f420ab0c7f24b8198e8b8a0040f8c06.mp4" as AnyObject,
            "https://assets.smallable.com/default/0001/63/thumb_62750_default_cms_listing_small.jpeg" as AnyObject,
            "https://hips.hearstapps.com/harpersbazaaruk.cdnds.net/17/04/2560x1920/sd-aspect-1485424206-bonpoint-show-h17-6.jpg" as AnyObject,
        ]
        
        self.view .addSubview(imagesView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

