//
//  ViewController.swift
//  Longdh_HealthTracker_TextureDemo
//
//  Created by Hoang Long on 26/07/2022.
//

import AsyncDisplayKit

class ViewController: ASDKViewController<BaseNode> {

    var headerNode = HeaderPresentation()
    var bodyNode = BodyPresentation()

    override init() {
        super.init(node: BaseNode())
        setView()
    }
    func setView(){
        node.backgroundColor = .white
        
        node.addSubnode(headerNode)
        node.addSubnode(bodyNode)
        self.node.layoutSpecBlock = { [weak self] parentNode, constrainedSize in
            print(constrainedSize as Any)
            guard let headerNode = self?.headerNode, let bodyNode = self?.bodyNode else { return ASLayoutSpec() }
            headerNode.clipsToBounds = true
            bodyNode.clipsToBounds = true
        
            let layout = ASAbsoluteLayoutSpec(children: [headerNode, bodyNode])
            headerNode.style.layoutPosition = CGPoint(x: 0, y: 0)
            bodyNode.style.layoutPosition = CGPoint(x: 0, y: 150)
            
            let stack = ASStackLayoutSpec(direction: .vertical, spacing: -25, justifyContent: .start, alignItems: .start, children: [headerNode, bodyNode])
        
            bodyNode.style.preferredSize = CGSize(width: constrainedSize.max.width, height: (constrainedSize.max.height - (constrainedSize.max.width*(143/375) - 25)))
            
            bodyNode.clipsToBounds = false
            
            return stack
            
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }


}

