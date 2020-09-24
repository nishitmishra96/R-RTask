//
//  OptionsTableViewDataSource.swift
//  Task
//
//  Created by Vikas on 23/09/20.
//  Copyright © 2020 XYZ. All rights reserved.
//

import Foundation
import UIKit

struct TableViewCellHeight{
    static let optionsCellHeight : CGFloat = 80
}

protocol TableViewDataSourceToViewControllerProtocol:class {
    func cellSelectedHaving(data:OptionsModel?)
}
class OptionsTableViewDataSource:NSObject,UITableViewDelegate,UITableViewDataSource{
    
    var dataArray : [OptionsModel?]?
    var tableView : UITableView?
    var rootDataSource : RootDataSource?
    weak var delegate : TableViewDataSourceToViewControllerProtocol?

    init(tableView:UITableView,delegate:TableViewDataSourceToViewControllerProtocol?){
        super.init()
        self.tableView = tableView
        self.rootDataSource = RootDataSource()
        self.delegate = delegate
        setData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.optionsTableViewCell, for: indexPath) as! OptionsTableViewCell
        cell.setCellWith(data: dataArray?[indexPath.row], indexPath: indexPath, delegate: self)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return TableViewCellHeight.optionsCellHeight
    }
    
    
    func setData(){
        rootDataSource?.getData(handler: {[weak self] (dataArray) in
            self?.dataArray = dataArray
            self?.tableView?.reloadData()
        })
    }
}


extension OptionsTableViewDataSource:TableViewCellToDataSourceProtocol{
    func cellSelectedAt(indexPath: IndexPath?) {
        guard let row = indexPath?.row else {return}
        delegate?.cellSelectedHaving(data: self.dataArray?[row])
    }
    
    
}
