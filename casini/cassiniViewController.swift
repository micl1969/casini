//
//  cassiniViewController.swift
//  casini
//
//  Created by Michael on 2016/10/6.
//  Copyright © 2016年 Michael. All rights reserved.
//

import UIKit

class cassiniViewController: UIViewController, UISplitViewControllerDelegate {

    private struct Storyboard{
        static let ShowImageSegue = "Show Image"
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Storyboard.ShowImageSegue{
            if let ivc = segue.destination.contentViewController as? imageViewController{
                let imageName = (sender as? UIButton)?.currentTitle
                ivc.imageURL = DemoURL.NASAImageNamed(imageName: imageName)
                ivc.title = imageName
            }
        }
    }
    
    @IBAction func showImage(_ sender: UIButton) {
        if let ivc = splitViewController?.viewControllers.last?.contentViewController as? imageViewController{
            let imageName = sender.currentTitle
            ivc.imageURL = DemoURL.NASAImageNamed(imageName: imageName)
            ivc.title = imageName
        }else{
            performSegue(withIdentifier: Storyboard.ShowImageSegue, sender: sender)
        }
        
    }

    //-----進入選單頁面 ？？
    override func viewDidLoad() {
        super.viewDidLoad()
        splitViewController?.delegate = self
    }
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool
    {
        if primaryViewController.contentViewController == self{
            if let ivc = secondaryViewController.contentViewController as? imageViewController , ivc.imageURL == nil{
                return true
            }
        }
        return false
    }
    //---入選單頁面 ？？
}
extension UIViewController{
    var contentViewController: UIViewController{
        if let navcon = self as? UINavigationController{
                return navcon.visibleViewController ?? self
        }else{
            return self
        }
    }
}
