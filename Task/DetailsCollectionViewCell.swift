//
//  DetailsCollectionViewCell.swift
//  Task
//
//  Created by Vikas on 24/09/20.
//  Copyright © 2020 XYZ. All rights reserved.
//

import UIKit

class DetailsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var descriptionImage: UIImageView!
    @IBOutlet weak var descriptionText: UILabel!
    
    var model:DetailsCollectionViewModel?
    override func layoutSubviews() {
        layer.masksToBounds = false
        layer.shadowRadius = 4
        layer.shadowOpacity = 0.2
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: 0 , height:2)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setDataWith(model:DetailsCollectionViewModel?){
        guard let model = model else {return}
        self.model = model
        self.descriptionImage.image = model.image
        self.descriptionText.text = model.description
        self.descriptionText.sizeToFit()
    }

}
