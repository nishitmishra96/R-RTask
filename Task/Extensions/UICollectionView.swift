//
//  UICollectionView.swift
//  Task
//
//  Created by Vikas on 24/09/20.
//  Copyright © 2020 XYZ. All rights reserved.
//

import Foundation
import UIKit

extension UICollectionView{
    func registerNibAsCell(nibName:String) {
        let cell = UINib(nibName: nibName, bundle: nil)
        self.register(cell, forCellWithReuseIdentifier: nibName)
    }
}
