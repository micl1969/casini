//
//  imageViewController.swift
//  casini
//
//  Created by Michael on 2016/10/6.
//  Copyright © 2016年 Michael. All rights reserved.
//

import UIKit

class imageViewController: UIViewController, UIScrollViewDelegate {

    var imageURL : NSURL? {
        didSet{
            image = nil
            if view.window != nil {
                fetchImage()
            }
        }
    }
    
    private func fetchImage(){
        if let url = imageURL {
            DispatchQueue.global(qos: .background).async{ //在背景執行
                self.spinner?.startAnimating()
                let contentofURL = NSData(contentsOf: url as URL)
                DispatchQueue.main.async {//回到主執行緒
                    if url == self.imageURL{
                        if let imageData = contentofURL{
                            self.image = UIImage(data : imageData as Data)
                        }else{
                            self.spinner?.stopAnimating()
                        }
                    }
                }
            }
        }
    }
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    
    @IBOutlet weak var scrollView: UIScrollView!{
        didSet{
            scrollView.contentSize = imageView.frame.size
            scrollView.delegate = self
            scrollView.minimumZoomScale = 0.03
            scrollView.maximumZoomScale = 1.0
        }
    }
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    private var imageView = UIImageView()
    
    private var image : UIImage? {
        get{
            return imageView.image
        }
        set{
            imageView.image = newValue
            imageView.sizeToFit()
            scrollView?.contentSize = imageView.frame.size
            spinner?.stopAnimating()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if image == nil{
            fetchImage()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.addSubview(imageView)
        //imageURL = NSURL(string: DemoURL.cassini)
    }


}
