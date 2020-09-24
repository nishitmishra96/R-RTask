//
//  DetailsCollectionViewDataSource.swift
//  Task
//
//  Created by Vikas on 24/09/20.
//  Copyright © 2020 XYZ. All rights reserved.
//

import Foundation
import UIKit

//struct TableViewCellHeight{
//    static let optionsCellHeight : CGFloat = 80
//}

protocol CollectionViewDataSourceToViewControllerProtocol:class {
    func currentScrolled(index:Int,total:Int)
}
class DetailsCollectionViewDataSource:NSObject,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    var dataArray : [DetailsCollectionViewModel?]?
    var collectionView : UICollectionView?
    var rootDataSource : DetailsCollectionViewRootDataSource?
    var pageControl : UIPageControl?
    weak var delegate : CollectionViewDataSourceToViewControllerProtocol?
    init(collectionView:UICollectionView,pageControl : UIPageControl?,delegate:CollectionViewDataSourceToViewControllerProtocol){
        super.init()
        self.collectionView = collectionView
        self.rootDataSource = DetailsCollectionViewRootDataSource()
        self.pageControl = pageControl
        self.delegate = delegate
        setData()
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        pageControl?.numberOfPages = dataArray?.count ?? 0
        delegate?.currentScrolled(index: 1, total: dataArray?.count ?? 0)
        return dataArray?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.detailsCollectionViewCell, for: indexPath) as! DetailsCollectionViewCell
        cell.setDataWith(model: self.dataArray?[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width * 0.75, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        var spaceFromCorner : CGFloat = 0
        spaceFromCorner =  (collectionView.frame.width -  collectionView.frame.width * 0.8)/2

        return UIEdgeInsets.init(top: 20, left: spaceFromCorner, bottom: 20, right: spaceFromCorner)
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        var multiplicationFactor = Int(scrollView.contentOffset.x ) / Int(scrollView.frame.width)
        let additionFactor = ((collectionView?.frame.width ?? 0) * 0.3) + 20 * CGFloat(multiplicationFactor)
        pageControl?.currentPage = Int(scrollView.contentOffset.x + additionFactor) / Int(scrollView.frame.width*0.7)
        delegate?.currentScrolled(index: Int(scrollView.contentOffset.x + additionFactor) / Int(scrollView.frame.width*0.7),total:dataArray?.count ?? 0)
    }
    
//    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//        let additionFactor = ((collectionView?.frame.width ?? 0) * 0.3) + 20
//        pageControl?.currentPage = Int(scrollView.contentOffset.x + additionFactor) / Int(scrollView.frame.width)
//    }
    func setData(){
        rootDataSource?.getData(handler: {[weak self] (dataArray) in
            self?.dataArray = dataArray
            self?.collectionView?.reloadData()
        })
    }
}
