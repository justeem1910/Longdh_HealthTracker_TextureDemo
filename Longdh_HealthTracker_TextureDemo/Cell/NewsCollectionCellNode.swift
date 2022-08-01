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
        setView()
    }
    
    func setView(){
        nodeNewsFeed.style.preferredSize = CGSize(width: 258, height: 220)
        nodeNewsFeed.clipsToBounds = true
        nodeNewsFeed.cornerRadius = 8
        
        imgShadow.style.preferredSize = CGSize(width: 258, height: 220)
        imgShadow.clipsToBounds = false
        imgShadow.backgroundColor = .white
        imgShadow.cornerRadius = 8
        imgShadow.borderWidth = 1
        imgShadow.borderColor = Constant.Color.gray5.cgColor
        imgShadow.shadowRadius = 20
        imgShadow.shadowOffset = CGSize(width: 0, height: 4)
        imgShadow.shadowOpacity = 1
        imgShadow.shadowColor = Constant.Color.shadowColor.cgColor
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let absoluteLayout = ASAbsoluteLayoutSpec(children: [imgShadow, nodeNewsFeed])
        imgShadow.style.layoutPosition = CGPoint(x: 0, y: 0)
        nodeNewsFeed.style.layoutPosition = CGPoint(x: 0, y: 0)
        
        return ASInsetLayoutSpec(insets: UIEdgeInsets(top: 0, left: 12,bottom: 0, right: 0), child: absoluteLayout)
    }
    
}
