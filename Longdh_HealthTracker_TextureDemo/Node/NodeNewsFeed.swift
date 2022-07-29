//
//  nodeNewFeed.swift
//  Longdh_HealthTracker_TextureDemo
//
//  Created by Hoang Long on 28/07/2022.
//

import AsyncDisplayKit
class NodeNewsFeed : ASDisplayNode {
    var imgNewsNode = ASNetworkImageNode()
    var imgNode = ASImageNode()
    var imgTextNode = ASImageNode()
    var textTitle = ASTextNode()
    var textSpecial = ASTextNode()
    var textDate = ASTextNode()
    
    override init() {
        super.init()
        automaticallyManagesSubnodes = true
        backgroundColor = .clear
        setView()
    }
    
    func setView(){
        imgNewsNode.clipsToBounds = true
       
        imgNewsNode.borderWidth = 1
        imgNewsNode.borderColor = Constant.Color.gray5.cgColor
        imgNewsNode.style.preferredSize = CGSize(width: 258, height: 134)
        imgTextNode.image = UIImage(named: Constant.Image.eclipse)
        
        textTitle.attributedText = NSAttributedString(string: "Jio Health khởi động chương trình Doctor Tour 2021", attributes: [NSAttributedString.Key.font : UIFont.init(name: Constant.Font.nunitoBold, size: 15), .foregroundColor : Constant.Color.gray1])
        textTitle.maximumNumberOfLines = 5
        textSpecial.attributedText = NSAttributedString(string: "Ưu đãi hot", attributes: [NSAttributedString.Key.font : UIFont(name: Constant.Font.nunitoSemiBold, size: 13), .foregroundColor: Constant.Color.green])
        textDate.attributedText = NSAttributedString(string: "28/6/2021", attributes: [NSAttributedString.Key.font : UIFont(name: Constant.Font.nunitoRegular, size: 13), .foregroundColor: Constant.Color.gray3 ])
    }
    func configViews(news: ArticleHomeModel?) {
        let imageURL = news?.picture
        let title = news?.title
        let special = news?.category_name
        let date = news?.created_at
        
        
        configViews(imageURLStr: imageURL, title: title, special: special, date: date)
    }
    
    func configViews(promotion: PromotionHomeModel?) {
        let imageURL = promotion?.picture
        let title = promotion?.name
        let special = promotion?.category_name
        let date = promotion?.created_at
        configViews(imageURLStr: imageURL, title: title, special: special, date: date)
    }

    private func configViews(imageURLStr: String?, title: String?, special: String?, date: String?) {
        imgNewsNode.url = URL(string: imageURLStr ?? " ")
        textTitle.attributedText = NSAttributedString(string: title ?? " ", attributes: [NSAttributedString.Key.font : UIFont.init(name: Constant.Font.nunitoBold, size: 15), .foregroundColor : Constant.Color.gray1])
        textTitle.maximumNumberOfLines = 5
        textSpecial.attributedText = NSAttributedString(string: special ?? " ", attributes: [NSAttributedString.Key.font : UIFont(name: Constant.Font.nunitoSemiBold, size: 13), .foregroundColor: Constant.Color.green])
        textDate.attributedText = NSAttributedString(string: date ?? " ", attributes: [NSAttributedString.Key.font : UIFont(name: Constant.Font.nunitoRegular, size: 13), .foregroundColor: Constant.Color.gray3 ])
    }

    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let stackSpecial = ASStackLayoutSpec(direction: .horizontal, spacing: 6, justifyContent: .start, alignItems: .center, children: [textSpecial, imgTextNode, textDate])
        
        let stackTitle = ASStackLayoutSpec(direction: .vertical, spacing: 4, justifyContent: .start, alignItems: .start, children: [textTitle, stackSpecial])
        textTitle.style.width = stackTitle.style.width
        
        let insetTitle = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12), child: stackTitle)
        
        let stackCell = ASStackLayoutSpec(direction: ASStackLayoutDirection.vertical, spacing: 12, justifyContent: .start, alignItems: .center, children: [imgNewsNode, insetTitle])
        
        
        stackCell.style.layoutPosition = CGPoint(x: 0, y: 0)
        stackCell.style.preferredSize = CGSize(width: 258, height: 220)
        
        return ASInsetLayoutSpec(insets: UIEdgeInsets(top: 0, left: 0, bottom: 12, right: 0), child: stackCell)
    }
}
