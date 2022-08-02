//
//  HomeNode.swift
//  Longdh_HealthTracker_TextureDemo
//
//  Created by Hoang Long on 27/07/2022.
//

import AsyncDisplayKit

class HomePresentation : ASDisplayNode {
    var headerNode = HeaderPresentation()
    var bodyNode = BodyPresentation()
    
    override init() {
        super.init()
        automaticallyManagesSubnodes = true
        backgroundColor = .white
        headerNode.clipsToBounds = true
        bodyNode.clipsToBounds = true
    }
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {        
        let stack = ASStackLayoutSpec(direction: .vertical, spacing: -25, justifyContent: .start, alignItems: .start, children: [headerNode, bodyNode])
        headerNode.style.preferredSize = CGSize(width: constrainedSize.max.width, height: constrainedSize.max.width * (143/375))
        bodyNode.style.preferredSize = CGSize(width: constrainedSize.max.width, height: (constrainedSize.max.height - (constrainedSize.max.width*(143/375) - 25)))
        
        return stack
    }
}
