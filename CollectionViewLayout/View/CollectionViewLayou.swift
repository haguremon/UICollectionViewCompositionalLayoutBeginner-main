//
//  CollectionViewLayou.swift
//  CollectionViewLayout
//
//  Created by IwasakIYuta on 2021/08/02.
//

import Foundation
import UIKit
class CollectionViewLayout {
    
    func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, layoutEnvironment -> NSCollectionLayoutSection? in
        if sectionIndex == 0 {
            //3グループの中にあるアイテムを作成
            let item = NSCollectionLayoutItem(layoutSize: .init(
                                                widthDimension: .fractionalWidth(1), //100%
                                                heightDimension: .fractionalHeight(1)))//100% 200
            //4　ここでセルの間をあける　三つの高さ200のセルが表示されるため
            item.contentInsets.leading = 3
            item.contentInsets.trailing = 3 //右からの間
            item.contentInsets.bottom = 19 //itemのボトムの間
            //2 グループを作成　グループのサイズを決める
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(
                                                            widthDimension: .fractionalWidth(1),//100%
                                                            heightDimension: .absolute(200)), //200の高さのグループ
                                                           subitems: [item])
            //1　セクションを決める
            let section = NSCollectionLayoutSection(group: group)
            //5 これだけでも分けることができるけどスペースがないとわかりずらい
            //section.orthogonalScrollingBehavior = .paging
            
            return section
        }
            else {
                //itemのサイズ
                let item = NSCollectionLayoutItem(layoutSize: .init(
                                                    widthDimension: .fractionalWidth(0.25), //アイテムの幅を25％
                                                    heightDimension: .absolute(150)))//100%
                //ここでセルの間をあける
                //item.contentInsets.leading = 3
                item.contentInsets.trailing = 3 //右からの間
                item.contentInsets.bottom = 15 //itemのボトムの間
                //グループを作成
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(500)), subitems: [item])//koko注意horizontal注意とかの引数
                
                let section = NSCollectionLayoutSection(group: group)
                item.contentInsets.leading = 3
                section.supplementariesFollowContentInsets = false
                //section.orthogonalScrollingBehavior = .paging
                return section
    
            }
        }
    return layout
    }
}
