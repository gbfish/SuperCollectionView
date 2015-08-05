//
//  CVController.swift
//  SuperCollectionView
//
//  Created by David Yu on 15/8/4.
//  Copyright © 2015年 David Yu. All rights reserved.
//

import UIKit

class CVController: UIViewController
{
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UICollectionView
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - UICollectionViewDataSource
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CVCell", forIndexPath: indexPath) as? CVCell else {
            return UICollectionViewCell()
        }
        
        return cell
    }
    
    // MARK: - CVModel
    
    var model = CVModel()
}
