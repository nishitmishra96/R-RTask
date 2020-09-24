//
//  BaseViewController.swift
//  Task
//
//  Created by Vikas on 23/09/20.
//  Copyright © 2020 XYZ. All rights reserved.
//

import UIKit


class BaseViewController: UIViewController {
    var heightOfNavigationBar : CGFloat = 0
    let backgroundImage = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Setting Navigation Bar Transparent
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        
        // Setting background image.
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "top_bg")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        heightOfNavigationBar = self.navigationController?.navigationBar.frame.height ?? 0.0
        backgroundImage.frame = CGRect.init(x: self.view.frame.minX, y: self.view.frame.minY - heightOfNavigationBar, width: self.view.frame.width, height: self.view.frame.height * 0.3)
        self.view.insertSubview(backgroundImage, at: 0)
        
//        self.view.backgroundColor = UIColor.init(hex: Colors.backgroundColor)
    }

}
