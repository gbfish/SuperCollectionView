//
//  ViewController.swift
//  SuperCollectionView
//
//  Created by David Yu on 15/7/30.
//  Copyright © 2015年 David Yu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if #available(iOS 9.0, *) {
            let stackView = UIStackView()
            stackView.alignment = UIStackViewAlignment.Center
        } else {
            // Fallback on earlier versions
        }
        
        
        let model = CVMImage()
        model.functionArray.append(CVFunctionLikeTap(tapId: 1234))
        
        model.functionArray[0].action()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //

}

