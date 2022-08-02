//
//  DoctorCollectionCellNode.swift
//  Longdh_HealthTracker_TextureDemo
//
//  Created by Hoang Long on 29/07/2022.
//

import AsyncDisplayKit

class DoctorCollectionCellNode: ASCellNode {
    let nodeDoctor = NodeDoctor()
 
    override init() {
        super.init()
        automaticallyManagesSubnodes = true
        backgroundColor = .white
        setView()
    }
    func setView(){
        nodeDoctor.cornerRadius = 8
        nodeDoctor.borderColor = Constant.Color.gray5.cgColor
        nodeDoctor.borderWidth = 1
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        return ASInsetLayoutSpec(insets: UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 0), child: nodeDoctor)
    }
}
