//
//  CollectionViewLayou.swift
//  CollectionViewLayout
//
//  Created by IwasakIYuta on 2021/08/02.
//

import Foundation
import UIKit
class CollectionViewLayout {
    static let headerId = "headerId"
    
    func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, layoutEnvironment -> NSCollectionLayoutSection? in
        if sectionIndex == 0 {
            //セクション０
            
            //3グループの中にあるアイテムを作成
            let item = NSCollectionLayoutItem(layoutSize: .init(
                                                widthDimension: .fractionalWidth(1), //100%グループの幅
                                                heightDimension: .fractionalHeight(1)))//100% 200
            //4　ここでセルの間をあける　三つの高さ200のセルが表示されるため
            item.contentInsets = .init(top: 10, leading: 3, bottom: 0, trailing: 3)
            //2 グループを作成　グループのサイズを決める
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(
                                                            widthDimension: .fractionalWidth(1),//100%fractional（分数）
                                                            heightDimension: .absolute(200)), //200の高さのグループ
                                                           subitems: [item])
            //1　セクションを決める
            let section = NSCollectionLayoutSection(group: group)
            //5 これでよかにScrollingする
            section.orthogonalScrollingBehavior = .paging
            section.contentInsets.bottom = 1
            return section
        
        }
            else if sectionIndex == 1 {
                //セクション1
                
                //3グループの中にあるアイテムを作成
                let item = NSCollectionLayoutItem(layoutSize: .init(
                                                    widthDimension: .fractionalWidth(0.25), //アイテムの幅25％グループの幅の25％
                                                    heightDimension: .absolute(150)))//アイテムの絶対値の高さなの
                //ここでセルの間をあける　8つの高さ150セルが表示されるため
                item.contentInsets = .init(top: 0, leading: 5, bottom: 5, trailing: 5)
                
                //2 グループを作成　グループのサイズを決める
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(
                                                                widthDimension: .fractionalWidth(1), //Viewの幅100%
                                                                heightDimension: .estimated(500)), //推定値500の高さ？
                                                               subitems: [item])
                group.contentInsets.trailing = 0
                //　1セクションを決める
                let section = NSCollectionLayoutSection(group: group)
                //section.contentInsets.trailing = 0
                //section.orthogonalScrollingBehavior = .continuous
                //boundarySupplementaryItemsをつけることができる//UICollectionReusableViewなど
                section.boundarySupplementaryItems = [
                    .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(40)),
                          elementKind: CollectionViewLayout.headerId,
                          alignment: .topLeading)
                ]
                return section
    
            } else if sectionIndex == 2 {
                //itemを作成
                let item = NSCollectionLayoutItem(layoutSize: .init(
                                                        widthDimension: .fractionalWidth(1), //100%グループの幅
                                                        heightDimension: .fractionalHeight(1)))//100% 125
                    //4　ここでセルの間をあける　三つの高さ200のセルが表示されるため
                    item.contentInsets = .init(top: 10, leading: 3, bottom: 0, trailing: 3)
                    //2 グループを作成　グループのサイズを決める
                    let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(
                                                                    widthDimension: .fractionalWidth(0.8),//80%fractional（分数）
                                                                    heightDimension: .absolute(125)), //absolute(絶対)125の高さグループ
                                                                   subitems: [item])
                //1sectionを作成
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                section.contentInsets.top = 1
                return section
            } else {
                
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(0.5),
                                                                    heightDimension: .absolute(250)))
                item.contentInsets.bottom = 16
                item.contentInsets.trailing = 16
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                                               heightDimension: .estimated(1000)), //1000の想定値の高さ
                                                             subitems: [item])
                //1sectionを作成
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets = .init(top: 32, leading: 16, bottom: 0, trailing: 0)
                return section
            }
        }
    return layout
    }
}
