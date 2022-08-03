//
//  HomeNode.swift
//  Longdh_HealthTracker_TextureDemo
//
//  Created by Hoang Long on 26/07/2022.
//

import AsyncDisplayKit


class HeaderPresentation: ASDisplayNode{
    let textName = ASTextNode()
    let textStatus = ASTextNode()
    var safeArea = CGFloat()
    let imgUser: ASImageNode = {
        let node = ASImageNode()
        node.contentMode = .scaleAspectFill
        return node
    }()
    
    let imgBgUser: ASImageNode = {
        let node = ASImageNode()
        node.contentMode = .scaleAspectFill
        node.backgroundColor = .clear
        return node
    }()
    let imgStatus: ASImageNode = {
        let node = ASImageNode()
        node.contentMode = .scaleAspectFill
        return node
    }()
    
    override init() {
        super.init()
        automaticallyManagesSubnodes = true
        backgroundColor = .clear
        
        setView()
    }
    func setView(){
        textName.attributedText = NSAttributedString(string: "Quỳnh ken" , attributes: [NSAttributedString.Key.font : UIFont(name: Constant.Font.nunitoBold, size: 15) ?? UIFont.systemFont(ofSize: 15, weight: .bold), NSAttributedString.Key.foregroundColor: UIColor.white])
        textStatus.attributedText = NSAttributedString(string: "Đang trực tuyến", attributes: [NSAttributedString.Key.font : UIFont(name: Constant.Font.nunitoRegular, size: 12) ?? UIFont.systemFont(ofSize: 12, weight: .regular), .foregroundColor: UIColor.white ])
        
        imgBgUser.image = UIImage(named: Constant.Image.backgroundHeader)
        imgUser.image = UIImage(named: Constant.Image.user)
        imgStatus.image = UIImage(named: Constant.Image.status)
        
        
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        
        let stackStatus = ASStackLayoutSpec(direction: .horizontal, spacing: 6, justifyContent: .start, alignItems: .center, children: [imgStatus, textStatus])
        stackStatus.style.height = ASDimensionMake(20)
        stackStatus.style.width = ASDimensionMake(constrainedSize.max.width)
        imgStatus.style.width = ASDimensionMake(8)
        imgStatus.style.height = ASDimensionMake(8)
        
        let stackUser = ASStackLayoutSpec(direction: .vertical, spacing: 0, justifyContent: .start, alignItems: .start, children: [textName, stackStatus])
        stackUser.style.height = ASDimensionMake(50)
        stackUser.style.width = ASDimensionMake(constrainedSize.max.width)
        
        
        //MARK: ASAbsoluteLayoutSpect long 2 image
        let absolute = ASAbsoluteLayoutSpec(children: [imgBgUser,stackUser,imgUser])
        imgBgUser.style.height = ASDimensionMake(constrainedSize.max.width * (143/375))
        imgBgUser.style.width = ASDimensionMake(constrainedSize.max.width)
        imgUser.style.width = ASDimensionMake(42)
        imgUser.style.height = ASDimensionMake(42)
        
        imgUser.style.layoutPosition = CGPoint(x: (constrainedSize.max.width - 16 - 42), y: 60)
        stackUser.style.layoutPosition = CGPoint(x: 16, y: 61)
        
        absolute.style.preferredSize = CGSize(width: constrainedSize.max.width, height: constrainedSize.max.width * (143/375))
        return absolute
    }
    
}

