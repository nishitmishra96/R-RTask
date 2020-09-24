//
//  UIPageControl.swift
//  Task
//
//  Created by Vikas on 24/09/20.
//  Copyright © 2020 XYZ. All rights reserved.
//

import Foundation
import UIKit

class CustomPageControl:UIPageControl{
    override func awakeFromNib() {
        super.awakeFromNib()
        self.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
    }
}
