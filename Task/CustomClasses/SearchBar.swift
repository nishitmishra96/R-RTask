//
//  SearchBar.swift
//  Task
//
//  Created by Vikas on 23/09/20.
//  Copyright © 2020 XYZ. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class JSSearchView : UISearchBar {
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        isTranslucent = true
    }
    override func draw(_ rect: CGRect) {
        super.draw(rect)


        let textFieldInsideSearchBar = value(forKey: "searchField") as? UITextField
        textFieldInsideSearchBar?.rightView = textFieldInsideSearchBar?.leftView
        textFieldInsideSearchBar?.leftViewMode = .never
        textFieldInsideSearchBar?.leftView?.frame = CGRect.init(x: 0, y: 0, width: 10, height: frame.height)
        textFieldInsideSearchBar?.rightViewMode = .always
        let attributes = [
            NSAttributedString.Key.foregroundColor: UIColor.gray,
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12, weight: .light) // Note the !
        ]

        textFieldInsideSearchBar?.attributedPlaceholder = NSAttributedString(string: "Looking For ...", attributes:attributes)
        textFieldInsideSearchBar?.textColor = .black
        textFieldInsideSearchBar?.backgroundColor = .white
        layer.masksToBounds = false
        layer.shadowRadius = 4
        layer.shadowOpacity = 0.2
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: 0 , height:2)
    }
}
