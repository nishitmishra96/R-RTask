//
//  OptionsTableView.swift
//  Task
//
//  Created by Vikas on 23/09/20.
//  Copyright © 2020 XYZ. All rights reserved.
//

import Foundation
import UIKit

class CommonTableView:UITableView{
    override func awakeFromNib() {
        super.awakeFromNib()
        separatorStyle = .none
        backgroundColor = .clear
    }
}
