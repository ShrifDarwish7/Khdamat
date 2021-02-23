//
//  GuideVC.swift
//  Khdamat
//
//  Created by Sherif Darwish on 16/02/2021.
//

import UIKit

class GuideVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var guide = [Guide]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guide.append(Guide(image: UIImage(named: "guide1")!, guideTitle: "Distinguish with our services", guideSubtitle: "Request your service in the easiest, distinctive and fast way"))
        guide.append(Guide(image: UIImage(named: "guide2")!, guideTitle: "Ease and speed of performance", guideSubtitle: "Through our application, enjoy the speed and high performance "))
        guide.append(Guide(image: UIImage(named: "guide3")!, guideTitle: "Create your premium account", guideSubtitle: "Please create your account on Kahdamat with ease and convenience"))
        
        pageControl.numberOfPages = 3
        pageControl.currentPage = 0
        
        pageControl.addTarget(self, action: #selector(self.handlePageCtrAction), for: .allTouchEvents)
        
        loadCollection()
        
    }
    
    @objc func handlePageCtrAction(){
        self.collectionView.scrollToItem(at: IndexPath(item: pageControl.currentPage, section: 0), at: .centeredHorizontally, animated: true)
    }
    
    @IBAction func skipAction(_ sender: Any) {
    }
    
    @IBAction func registerAction(_ sender: Any) {
        Router.toRegister(sender: self)
    }
    
    @IBAction func signinAction(_ sender: Any) {
        Router.toSignin(sender: self)
    }
}

extension GuideVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func loadCollection(){
        let nib = UINib(nibName: "GuideCollectionViewCell", bundle: nil)
        self.collectionView.register(nib, forCellWithReuseIdentifier: "GuideCollectionViewCell")
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.reloadData()
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.guide.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GuideCollectionViewCell", for: indexPath) as! GuideCollectionViewCell
        cell.guideImageView.image = self.guide[indexPath.row].image
        cell.titleLbl.text = self.guide[indexPath.row].guideTitle
        cell.subtitleLbl.text = self.guide[indexPath.row].guideSubtitle
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        self.pageControl.currentPage = indexPath.row
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.frame.width, height: self.collectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

struct Guide {
    var image: UIImage
    var guideTitle: String
    var guideSubtitle: String
}
