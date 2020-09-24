//
//  DetailsViewController.swift
//  Task
//
//  Created by Vikas on 24/09/20.
//  Copyright © 2020 XYZ. All rights reserved.
//

import UIKit

class DetailsViewController: BaseViewController {
    @IBOutlet weak var topSubHeading: UILabel!
    @IBOutlet weak var chapterNumber: UILabel!
    @IBOutlet weak var headingForCollectionViewCell: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: CustomPageControl!
    var model : OptionsModel?
    var detailsCollectionViewDataSource:DetailsCollectionViewDataSource?
    var flowLayout : UICollectionViewFlowLayout{
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        return flowLayout
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        registerCollectionViewCells()
        setUpTableViewDataSource()
        setUpCollectionView()
        setupDataOnViewController()
    }
    func setupDataOnViewController(){
        self.topSubHeading.text = model?.subtitle
        self.setNavigationTitleWith(titleString: model?.title)
        setBackButtonImage()
    }
    
    func registerCollectionViewCells(){
        collectionView.registerNibAsCell(nibName: CollectionViewCell.detailsCollectionViewCell)
    }
    
    func setUpTableViewDataSource(){
        detailsCollectionViewDataSource = DetailsCollectionViewDataSource(collectionView: collectionView,pageControl: pageControl, delegate: self)
    }
    
    func setUpCollectionView(){
        collectionView.delegate = detailsCollectionViewDataSource
        collectionView.dataSource = detailsCollectionViewDataSource
    }
    
}
extension DetailsViewController:CollectionViewDataSourceToViewControllerProtocol{
    func currentScrolled(index: Int,total:Int) {
        if index == 0{
            self.chapterNumber.text = "Chapter 1/\(total)"
            return
        }
        self.chapterNumber.text = "Chapter \(index)/\(total)"
    }
    
    
}
