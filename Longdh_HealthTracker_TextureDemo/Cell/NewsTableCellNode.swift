//
//  NewsTableCellNode.swift
//  Longdh_HealthTracker_TextureDemo
//
//  Created by Hoang Long on 27/07/2022.
//

import AsyncDisplayKit
import Darwin
import CoreGraphics

class NewsTableCellNode: ASCellNode, ASCollectionDelegate, ASCollectionDataSource {
    var textTitle = ASTextNode()
    var textSeeAll = ASTextNode()
    var imgSeeAll = ASImageNode()
    var articleList     : [ArticleHomeModel]?
    var promotionList     : [PromotionHomeModel]?
    
    var collectionNode:ASCollectionNode = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 0
        let node = ASCollectionNode(collectionViewLayout: flowLayout)
        node.showsHorizontalScrollIndicator = false
        node.showsVerticalScrollIndicator = false
        node.backgroundColor = .clear
        node.clipsToBounds = false
        return node
    }()
    
    override init() {
        super.init()
        automaticallyManagesSubnodes = true
        backgroundColor = .clear
        clipsToBounds = false
        setView()
        
    }
    func setView(){
        collectionNode.delegate = self
        collectionNode.dataSource = self
        collectionNode.style.preferredSize = CGSize(width: UIScreen.main.bounds.width, height: 220)
        collectionNode.contentInset = UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 12)
      
        textTitle.attributedText = NSAttributedString(string: "Tin tức",attributes: [NSAttributedString.Key.font : UIFont(name: Constant.Font.nunitoBold, size: 17), .foregroundColor: Constant.Color.purple1])
        textTitle.style.preferredSize = CGSize(width: 120, height: 22)
        textTitle.style.alignSelf = .start
        
        textSeeAll.attributedText = NSAttributedString(string: "Xem tất cả", attributes: [NSAttributedString.Key.font : UIFont(name: Constant.Font.nunitoSemiBold, size: 13), .foregroundColor: Constant.Color.green])
        
        imgSeeAll.image = UIImage(named: Constant.Image.seeAll)
        imgSeeAll.contentMode = .scaleAspectFit
        imgSeeAll.style.preferredSize = CGSize(width: 16, height: 16)
        
        
    }
    func configViewsArticle(articleList: [ArticleHomeModel]? ) {
        self.articleList = articleList
        textTitle.attributedText = NSAttributedString(string: "Tin tức",attributes: [NSAttributedString.Key.font : UIFont(name: Constant.Font.nunitoBold, size: 17), .foregroundColor: Constant.Color.purple1])
        self.promotionList = nil
    }
    
    func configViewsPromotion(promotionList: [PromotionHomeModel]?) {
        textTitle.attributedText = NSAttributedString(string: "Khuyến mại",attributes: [NSAttributedString.Key.font : UIFont(name: Constant.Font.nunitoBold, size: 17), .foregroundColor: Constant.Color.purple1])
        self.articleList = nil
        self.promotionList = promotionList
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let stackSeeAll = ASStackLayoutSpec(direction: .horizontal, spacing: 2, justifyContent: .center, alignItems: .center, children: [textSeeAll, imgSeeAll])
        let absoluteTitle = ASAbsoluteLayoutSpec(children: [textTitle, stackSeeAll])
        textTitle.style.layoutPosition =  CGPoint(x: 16, y: 0)
        stackSeeAll.style.layoutPosition = CGPoint(x: constrainedSize.max.width - 96, y: 0)
    
        let stackCell = ASStackLayoutSpec(direction: .vertical, spacing: 16, justifyContent: .start, alignItems: .start, children: [absoluteTitle, collectionNode])
        stackCell.style.preferredSize = CGSize(width: constrainedSize.max.width, height: 286)
        return ASInsetLayoutSpec(insets: .zero, child: stackCell)
    }
    
    
    //MARK: DELEGATE
    func collectionNode(_ collectionNode: ASCollectionNode, constrainedSizeForItemAt indexPath: IndexPath) -> ASSizeRange {
        return ASSizeRange(min: CGSize(width: 0, height: 220), max: CGSize(width:270, height: 220))
    }
    
    //MARK: DATASOURCE
    func numberOfSections(in collectionNode: ASCollectionNode) -> Int {
        return 1
    }
    
    func collectionNode(_ collectionNode: ASCollectionNode, numberOfItemsInSection section: Int) -> Int {
        if let articleList = articleList {
            return articleList.count
        }
        return promotionList?.count ?? 0
    }
    
    func collectionNode(_ collectionNode: ASCollectionNode, nodeBlockForItemAt indexPath: IndexPath) -> ASCellNodeBlock {
        return { [weak self] in
            let cell = NewsCollectionCellNode()
            cell.clipsToBounds = false
            if let self = self {
                if let articleList = self.articleList {
                    let news = articleList[indexPath.item]
                    cell.nodeNewsFeed.configViews(news: news)
                    return cell
                }
                let promotion = self.promotionList?[indexPath.item]
                cell.nodeNewsFeed.configViews(promotion: promotion)
                return cell
            }
            return ASCellNode()
        }
        
    }
}

