//
//  ViewController.swift
//  Task
//
//  Created by Vikas on 23/09/20.
//  Copyright © 2020 XYZ. All rights reserved.
//

import UIKit

class ViewController: BaseViewController {

    @IBOutlet weak var searchbar: JSSearchView!
    @IBOutlet weak var optionsTableView: CommonTableView!
    @IBOutlet weak var upperViewHeight: NSLayoutConstraint!
    var optionsTableViewDataSource:OptionsTableViewDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        registerTableViewCells()
        setUpTableViewDataSource()
        setUpTableView()
        upperViewHeight.constant = self.view.frame.height * 0.3 - heightOfNavigationBar
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setNavigationTitleWith(titleString: Titles.viewControllerTitle)
        setBackButtonImage()
    }
    func registerTableViewCells(){
        optionsTableView.registerNibAsCell(nibName: TableViewCell.optionsTableViewCell)
    }
    
    func setUpTableViewDataSource(){
        optionsTableViewDataSource = OptionsTableViewDataSource(tableView: optionsTableView, delegate: self)
    }
    
    func setUpTableView(){
        optionsTableView.delegate = optionsTableViewDataSource
        optionsTableView.dataSource = optionsTableViewDataSource
    }

}

extension ViewController: TableViewDataSourceToViewControllerProtocol{
    func cellSelectedHaving(data: OptionsModel?) {
        let nextViewController = Storyboard.Main.instanceOf(viewController: DetailsViewController.self)!
        nextViewController.model = data
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
}

class RootDataSource:NSObject{
    var dataArray : [OptionsModel?]?
    
    override init(){
        super.init()
        dataArray = []
    }
    
    func getData(handler:@escaping (([OptionsModel?]?)->())){
        dataArray?.append(OptionsModel.init(image: UIImage(named: "1"), title: "Why Invest?", subtitle: "Why you should invest in stock market?"))
        dataArray?.append(OptionsModel.init(image: UIImage(named: "2"), title: "Basics of stock market.", subtitle: "What you should know before investing?"))
        dataArray?.append(OptionsModel.init(image: UIImage(named: "3"), title: "Finding great companies.", subtitle: "Why you should invest?"))
        dataArray?.append(OptionsModel.init(image: UIImage(named: "4"), title: "Your investing life", subtitle: "Everything you should know about investing"))
        dataArray?.append(OptionsModel.init(image: UIImage(named: "5"), title: "Getting Started", subtitle: "How you should investing?"))

        handler(dataArray)
    }
}

struct OptionsModel {
    var image : UIImage?
    var title : String?
    var subtitle : String?
}
