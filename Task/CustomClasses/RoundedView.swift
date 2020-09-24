//
//  RoundedView.swift
//  Task
//
//  Created by Vikas on 23/09/20.
//  Copyright © 2020 XYZ. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class RoundedEdges:UIView{
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.height / 5
    }
}

@IBDesignable class CollectionViewRoundedEdges:UIView{
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.height / 30
    }
}

@IBDesignable class TopRoundedEdges:UIView{
    override func layoutSubviews() {
        super.layoutSubviews()
        roundCorners(corners: [.topLeft,.topRight], radius: frame.height / 20)
    }
}
extension UIView {
   func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
