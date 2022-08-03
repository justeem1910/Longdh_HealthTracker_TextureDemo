//
//  NewsCollectionNode.swift
//  Longdh_HealthTracker_TextureDemo
//
//  Created by Hoang Long on 27/07/2022.
//

import AsyncDisplayKit

class NewsCollectionCellNode: ASCellNode {
    let nodeNewsFeed = NodeNewsFeed()
    let imgShadow = ASImageNode()
    override init() {
        super.init()
        automaticallyManagesSubnodes = true
        backgroundColor = .clear
        clipsToBounds = false
        setView()
    }
    
    func setView(){
        nodeNewsFeed.style.preferredSize = CGSize(width: Constant.Size.newsCollectionCellWidth, height: Constant.Size.newsCollectionCellHeight)
        nodeNewsFeed.clipsToBounds = true
        nodeNewsFeed.cornerRadius = 8
        
        imgShadow.style.preferredSize = CGSize(width: Constant.Size.newsCollectionCellWidth, height: Constant.Size.newsCollectionCellHeight)
        imgShadow.clipsToBounds = false
        imgShadow.backgroundColor = .white
        imgShadow.cornerRadius = 8
        imgShadow.shadowRadius = 20
        imgShadow.shadowOffset = CGSize(width: 0, height: 4)
        imgShadow.shadowOpacity = 1
        imgShadow.shadowColor = Constant.Color.shadowColor.cgColor
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let absoluteLayout = ASAbsoluteLayoutSpec(children: [imgShadow, nodeNewsFeed])
        imgShadow.style.layoutPosition = CGPoint(x: 0, y: 0)
        nodeNewsFeed.style.layoutPosition = CGPoint(x: 0, y: 0)
        
        return absoluteLayout
    }
    
}
