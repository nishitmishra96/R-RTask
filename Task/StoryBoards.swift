//
//  StoryBoards.swift
//  HCLMusic
//
//  Created by Himanshu Singh on 24/04/19.
//  Copyright © 2019 Himanshu Singh. All rights reserved.
//

import Foundation
import UIKit
enum Storyboard: String {
    case Main = "Main"
    var instance: UIStoryboard {
        return UIStoryboard(name: rawValue, bundle: nil)
    }
    
    func instanceOf<T: UIViewController>(viewController: T.Type) -> T? {
        let x = String(describing: viewController.self)
        return instance.instantiateViewController(withIdentifier: x) as? T
    }
}
