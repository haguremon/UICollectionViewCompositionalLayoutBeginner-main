//
//  HeaderCollectionReusableView.swift
//  UICollectionViewCompositionalLayoutBeginner
//
//  Created by IwasakIYuta on 2021/08/05.
//

import Foundation
import UIKit

//UIviewを作るときの流れ//UIviewのライフサイクルと知らないとな
class Header: UICollectionReusableView {
    
    var label: UILabel = {
         let label = UILabel()
         label.textColor = .white
        label.font = .boldSystemFont(ofSize: 33)
        //label.backgroundColor = .systemGray
        label.clipsToBounds = true //cellからはみ出さないようにする
         return label
     }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(label)//addSubview
        label.frame.size = self.frame.size
        //label.text = "カテゴリー"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
