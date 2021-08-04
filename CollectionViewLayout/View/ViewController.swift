//
//  ViewController.swift
//  CollectionViewLayout
//
//  Created by IwasakIYuta on 2021/08/02.
//

import UIKit

class ViewController: UIViewController {
    let headerId = "headerId"
   
    private var collectionViewLayout = CollectionViewLayout()
    private var collectionView: UICollectionView? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "CollectionViewLayout"
        configureHierarchy()
       
    }
    
    func configureHierarchy() {
        
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: collectionViewLayout.createLayout())
        collectionView?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView?.backgroundColor = .white
        
        //Headerを作成
        collectionView?.register(Header.self, forSupplementaryViewOfKind: CollectionViewLayout.headerId, withReuseIdentifier: headerId)
        
        collectionView?.register(CollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        
        view.addSubview(collectionView!)
            
        collectionView!.delegate = self
        collectionView!.dataSource = self
        
        
    }
    


}
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
   
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 3
        case 1:
            return 8
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        switch indexPath.section {
        case 0:
            cell.label.text = "w"
            return cell
        case 1:
            cell.label.text = "a"
            return cell
        default:
            break
        }
        return cell
    }
   
    //ReusableのHederUIViewをcollectionViewに用意する
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! Header
        if indexPath.section == 1 {
            header.backgroundColor = .green
            header.label.text = "カテゴリー"
        
        }
        return header
    }
   
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("tapped")
    }


}

