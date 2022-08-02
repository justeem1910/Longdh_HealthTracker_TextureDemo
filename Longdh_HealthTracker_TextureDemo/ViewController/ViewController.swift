//
//  ViewController.swift
//  Longdh_HealthTracker_TextureDemo
//
//  Created by Hoang Long on 26/07/2022.
//

import AsyncDisplayKit

class ViewController: ASDKViewController<BaseNode> {
    
    var homeNode = HomePresentation()
    override init() {
        super.init(node: BaseNode())
        setView()
    }
    
    func setView(){
        node.backgroundColor = .white
        
        self.node.layoutSpecBlock = { [weak self] parentNode, constrainedSize in
            guard let homeNode = self?.homeNode else { return ASLayoutSpec() }
            let layout = ASAbsoluteLayoutSpec(children: [homeNode])
            homeNode.style.layoutPosition = CGPoint(x: 0, y: 0)
            return layout
        }
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
   
}

