//
//  AppDelegate.swift
//  3DTouchDemo
//
//  Created by vu.van.hanh on 12/27/17.
//  Copyright © 2017 vu.van.hanh. All rights reserved.
//

import UIKit
import Foundation

class SpecialViewController: UIViewController {

   
    @IBOutlet weak var peekAndPopButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if is3DTouchAvailable {
            registerForPreviewing(with: self, sourceView: view)
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

//PRAGMA MARK :- Peek and Pop
extension SpecialViewController: UIViewControllerPreviewingDelegate {
   
    var is3DTouchAvailable: Bool {
        return view.traitCollection.forceTouchCapability == .available
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        tabBarController?.selectedIndex = TouchActions.favorite.number
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        
        guard let favoriteViewController = storyboard?.instantiateViewController(withIdentifier: "favoriteVC"), peekAndPopButton.frame.contains(location)  else { return nil}
        
        favoriteViewController.preferredContentSize = CGSize(width: 0, height: 300.0)
        
        return favoriteViewController
    }
    
    
}
