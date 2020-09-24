//
//  UITableView.swift
//  Task
//
//  Created by Vikas on 23/09/20.
//  Copyright © 2020 XYZ. All rights reserved.
//

import Foundation
import UIKit
extension UITableView{
    func registerNibAsCell(nibName:String) {
        let cell = UINib(nibName: nibName, bundle: nil)
        self.register(cell, forCellReuseIdentifier: nibName)
    }
}
