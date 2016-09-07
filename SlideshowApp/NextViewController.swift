//
//  NextViewController.swift
//  SlideshowApp
//
//  Created by 里舘 徹 on 2016/09/05.
//  Copyright © 2016年 tooru.satodate. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {

    @IBOutlet weak var resultImg: UIImageView!
  
    
    var resultImgs: UIImage!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let myImage = resultImgs!
        
        resultImg.image = myImage
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}
