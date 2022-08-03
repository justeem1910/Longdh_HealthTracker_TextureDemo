//
//  NewsTableCellNode.swift
//  Longdh_HealthTracker_TextureDemo
//
//  Created by Hoang Long on 27/07/2022.
//

import AsyncDisplayKit


class NewsTableCellNode: ASCellNode {
    var textTitle = ASTextNode()
    var textSeeAll = ASTextNode()
    var imgSeeAll = ASImageNode()
    var articleList: [ArticleHomeModel]?
    var promotionList: [PromotionHomeModel]?
    var typeCell: TypeCell?
    
    var collectionNode:ASCollectionNode = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = Constant.Size.spacingCollectionCell
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
        collectionNode.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 12)
      
        textTitle.attributedText = NSAttributedString(string: "Tin tức",attributes: [NSAttributedString.Key.font : UIFont(name: Constant.Font.nunitoBold, size: 17) ?? UIFont.boldSystemFont(ofSize: 17), .foregroundColor: Constant.Color.purple1])
        textTitle.style.preferredSize = CGSize(width: Constant.Size.textTitleTableCellWidth, height: Constant.Size.textTitleTableCellHeight)

        
        textSeeAll.attributedText = NSAttributedString(string: "Xem tất cả", attributes: [NSAttributedString.Key.font : UIFont(name: Constant.Font.nunitoSemiBold, size: 13) ?? UIFont.systemFont(ofSize: 13, weight: .semibold), .foregroundColor: Constant.Color.green])
        
        imgSeeAll.image = UIImage(named: Constant.Image.seeAll)
        imgSeeAll.contentMode = .scaleAspectFit
        imgSeeAll.style.preferredSize = CGSize(width: 16, height: 16)
        
        
    }
    func configViewsArticle(articleList: [ArticleHomeModel]? ) {
        typeCell = .newsCell
        textTitle.attributedText = NSAttributedString(string: "Tin tức",attributes: [NSAttributedString.Key.font : UIFont(name: Constant.Font.nunitoBold, size: 17) ?? UIFont.boldSystemFont(ofSize: 17), NSAttributedString.Key.foregroundColor: Constant.Color.purple1])
        self.articleList = articleList
        self.promotionList = nil
    }
    
    func configViewsPromotion(promotionList: [PromotionHomeModel]?) {
        typeCell = .promotionCell
        textTitle.attributedText = NSAttributedString(string: "Khuyến mại",attributes: [NSAttributedString.Key.font : UIFont(name: Constant.Font.nunitoBold, size: 17) ?? UIFont.systemFont(ofSize: 13, weight: .semibold), .foregroundColor: Constant.Color.purple1])
        self.articleList = nil
        self.promotionList = promotionList
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let stackSeeAll = ASStackLayoutSpec(direction: .horizontal, spacing: 2, justifyContent: .center, alignItems: .center, children: [textSeeAll, imgSeeAll])
        
        let absoluteTitle = ASAbsoluteLayoutSpec(children: [textTitle, stackSeeAll])
        textTitle.style.layoutPosition =  CGPoint(x: Constant.Size.spacingTextTitleTableCell, y: 0)
        stackSeeAll.style.layoutPosition = CGPoint(x: constrainedSize.max.width - Constant.Size.buttonSeeAllWidth - Constant.Size.spacingButtonSeeAll, y: 0)
    
        let stackCell = ASStackLayoutSpec(direction: .vertical, spacing: 16, justifyContent: .start, alignItems: .start, children: [absoluteTitle, collectionNode])
        stackCell.style.preferredSize = CGSize(width: constrainedSize.max.width, height: Constant.Size.newsTableCellHeight)
        
        return ASInsetLayoutSpec(insets: .zero, child: stackCell)
    }
}


//MARK: ASCollectionDelegate
extension NewsTableCellNode: ASCollectionDelegate {
    func collectionNode(_ collectionNode: ASCollectionNode, constrainedSizeForItemAt indexPath: IndexPath) -> ASSizeRange {
        return ASSizeRange(min: CGSize(width: 0, height: 0), max: CGSize(width: Constant.Size.newsCollectionCellWidth, height: Constant.Size.newsCollectionCellHeight))
    }
}

//MARK: ASCollectionDataSource
extension NewsTableCellNode: ASCollectionDataSource {
    func numberOfSections(in collectionNode: ASCollectionNode) -> Int {
        return 1
    }
    
    func collectionNode(_ collectionNode: ASCollectionNode, numberOfItemsInSection section: Int) -> Int {
        switch self.typeCell {
        case .newsCell:
            return self.articleList?.count ?? 0
        case .promotionCell:
            return self.promotionList?.count ?? 0
        default:
            return 0
        }
    }
    
    func collectionNode(_ collectionNode: ASCollectionNode, nodeBlockForItemAt indexPath: IndexPath) -> ASCellNodeBlock {
        return { [weak self] in
            
            let cell = NewsCollectionCellNode()
            
            switch self?.typeCell {
            case .newsCell:
                let news = self?.articleList?[indexPath.item]
                cell.nodeNewsFeed.configViews(news: news)
                return cell
            case .promotionCell:
                let promotion = self?.promotionList?[indexPath.item]
                cell.nodeNewsFeed.configViews(promotion: promotion)
                return cell
            default:
                return cell
            }
        }
        
    }
}
