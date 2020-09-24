//
//  optionsTableViewCell.swift
//  Task
//
//  Created by Vikas on 23/09/20.
//  Copyright © 2020 XYZ. All rights reserved.
//

import UIKit

protocol TableViewCellToDataSourceProtocol:class{
    func cellSelectedAt(indexPath:IndexPath?)
}

class OptionsTableViewCell: UITableViewCell {

    @IBOutlet var containerView: RoundedEdges!
    @IBOutlet var supportingImage: UIImageView!
    @IBOutlet var title: UILabel!
    @IBOutlet var subtitle: UILabel!
    var dataObject : OptionsModel?
    var indexPath:IndexPath?
    weak var delegate : TableViewCellToDataSourceProtocol?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func layoutSubviews() {
        layer.masksToBounds = false
        layer.shadowRadius = 4
        layer.shadowOpacity = 0.2
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0 , height:2)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.supportingImage.image = UIImage()
        self.title.text = ""
        self.subtitle.text = ""
    }
    
    @IBAction func cellSelected(_ sender: Any) {
        delegate?.cellSelectedAt(indexPath: indexPath)
    }
    
    func setCellWith(data:OptionsModel?,indexPath:IndexPath?,delegate:TableViewCellToDataSourceProtocol?){
        guard let data = data else {return}
        guard let indexPath = indexPath else {return}
        self.indexPath = indexPath
        self.dataObject = data
        self.delegate = delegate
        supportingImage.image = data.image
        title.text = data.title
        subtitle.text = data.subtitle
        subtitle.sizeToFit()
    }
    
}
