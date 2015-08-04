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
//            stackView.distribution = UIStackViewDistribution.
        } else {
            // Fallback on earlier versions
        }
        
//        let a = UIView()
//        a.frame.origin
//        let collectionContentInset = UIEdgeInsetsMake(64.0, 10.0, 0.0, 10.0)
        
        
        
//        model.functionArray[0].puchViewController(navigationController!)
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
//        let model = CVModelImage(imageUrlPart: "fake url")
//        model.functionArray.append(CVFunctionLikeTap(tapId: 1234))
//        
//        model.functionArray[0].action(navigationController)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //
    @IBAction func redAction(sender: UITapGestureRecognizer) {
        print("red action")
        
        let viewController = UIStoryboard(name: "CVStoryboard", bundle: nil).instantiateViewControllerWithIdentifier("CVController")
        navigationController?.pushViewController(viewController, animated: true)
    }

    @IBAction func greenAction(sender: UITapGestureRecognizer) {
        print("green action")
    }
}

