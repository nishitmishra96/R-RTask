//
//  DetailsCollectionViewRootDataSource.swift
//  Task
//
//  Created by Vikas on 24/09/20.
//  Copyright © 2020 XYZ. All rights reserved.
//

import Foundation
import UIKit

struct DetailsCollectionViewModel {
    var image : UIImage?
    var description : String?
}

class DetailsCollectionViewRootDataSource:NSObject{
    var dataArray : [DetailsCollectionViewModel?]?
    
    override init(){
        super.init()
        dataArray = []
    }
    
    func getData(handler:@escaping (([DetailsCollectionViewModel?]?)->())){
        dataArray?.append(DetailsCollectionViewModel.init(image: UIImage(named: "card1"), description: "Owning a stock means owning a company.\nInvested funds are working for you 24/7. invested money can grow much faster than cash in a savings account."))
        dataArray?.append(DetailsCollectionViewModel.init(image: UIImage(named: "card2"), description: "Owning a stock means owning a company.\nInvested funds are working for you 24/7. invested money can grow much faster than cash in a savings account."))
        dataArray?.append(DetailsCollectionViewModel.init(image: UIImage(named: "card3"), description: "Owning a stock means owning a company.\nInvested funds are working for you 24/7. invested money can grow much faster than cash in a savings account."))
        dataArray?.append(DetailsCollectionViewModel.init(image: UIImage(named: "card4"), description: "Owning a stock means owning a company.\nInvested funds are working for you 24/7. invested money can grow much faster than cash in a savings account."))
        dataArray?.append(DetailsCollectionViewModel.init(image: UIImage(named: "card5"), description: "Owning a stock means owning a company.\nInvested funds are working for you 24/7. invested money can grow much faster than cash in a savings account."))
        dataArray?.append(DetailsCollectionViewModel.init(image: UIImage(named: "card5"), description: "Owning a stock means owning a company.\nInvested funds are working for you 24/7. invested money can grow much faster than cash in a savings account."))
        handler(dataArray)
    }
}


