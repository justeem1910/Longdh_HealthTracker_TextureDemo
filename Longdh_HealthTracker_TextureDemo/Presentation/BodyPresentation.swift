//
//  BodyNode.swift
//  Longdh_HealthTracker_TextureDemo
//
//  Created by Hoang Long on 27/07/2022.
//

import AsyncDisplayKit

class BodyPresentation : ASDisplayNode, ASTableDelegate, ASTableDataSource {
    var tableNode:ASTableNode = ASTableNode()
    var newsModel: HomeModel?
    
    override init() {
        super.init()
        automaticallyManagesSubnodes = true
        self.backgroundColor = .white
        self.cornerRadius = 16
        self.clipsToBounds = false
        self.setView()
        
       

    }
    func setView (){
        tableNode.backgroundColor = .clear
        tableNode.delegate = self
        tableNode.dataSource = self
        tableNode.view.showsVerticalScrollIndicator = false
        tableNode.view.showsHorizontalScrollIndicator = false
        tableNode.view.separatorStyle = .none
        fetchDataNewsFeed()
        
    }
    
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let layout = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0), child: tableNode)
        
        return layout
        
    }
    func fetchDataNewsFeed() {
        self.showLoaderView()
        APIUtilities.requestHomePatientNewsFeed{ [weak self] newFeedResult, error in
            guard let self = self else { return}

            guard let newsFeedResult = newFeedResult, error == nil else {
                return
            }
            self.newsModel = newsFeedResult

            DispatchQueue.main.async{ [weak self] in
                guard let self = self else { return}
                self.tableNode.reloadData()
                self.dismissLoaderView()
            }
        }

    }
    
    func tableNode(_ tableNode: ASTableNode, constrainedSizeForRowAt indexPath: IndexPath) -> ASSizeRange {
          let width = UIScreen.main.bounds.width
          return ASSizeRangeMake(CGSize(width: width, height: 0), CGSize(width: width, height: 296))
        
    }
    
    func numberOfSections(in tableNode: ASTableNode) -> Int {
        return 1
    }
    
    func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableNode(_ tableNode: ASTableNode, nodeBlockForRowAt indexPath: IndexPath) -> ASCellNodeBlock {
        if indexPath.item == 0 {
            return { [weak self] in
                let cell = NewsTableCellNode()
                cell.selectionStyle = .none
                cell.configViewsArticle(articleList: self?.newsModel?.articleList)
                return cell
            }
        
        } else if indexPath.item == 1 {
            return { [weak self] in
                let cell = NewsTableCellNode()
                cell.selectionStyle = .none
                cell.configViewsPromotion(promotionList: self?.newsModel?.promotionList)
                return cell
            }
        } else if indexPath.item == 2 {
            return { [weak self] in
                let cell = DoctorTableCellNode()
                cell.selectionStyle = .none
                cell.doctorList = self?.newsModel?.doctorList
                return cell
            }
        }
        return {
            return ASCellNode()
        }
    }
    
}
