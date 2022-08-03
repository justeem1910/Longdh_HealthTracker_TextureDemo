//
//  DoctorTableCellNode.swift
//  Longdh_HealthTracker_TextureDemo
//
//  Created by Hoang Long on 29/07/2022.
//

import AsyncDisplayKit

class DoctorTableCellNode: ASCellNode{
    var textTitle = ASTextNode()
    var textSeeAll = ASTextNode()
    var imgSeeAll = ASImageNode()
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
    
    var doctorList:[DoctorHomeModel]?
    
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
        collectionNode.style.preferredSize = CGSize(width: UIScreen.main.bounds.width, height: Constant.Size.doctorCollectionCellMaxHeight)
        collectionNode.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 12)
        
        textTitle.attributedText = NSAttributedString(string: "Giới thiệu bác sĩ",attributes: [NSAttributedString.Key.font : UIFont(name: Constant.Font.nunitoBold, size: 17) ?? UIFont.boldSystemFont(ofSize: 17), .foregroundColor: Constant.Color.purple1])
        textTitle.style.preferredSize = CGSize(width: Constant.Size.textTitleTableCellWidth, height: Constant.Size.textTitleTableCellHeight)
        textTitle.style.alignSelf = .start
        
        textSeeAll.attributedText = NSAttributedString(string: "Xem tất cả", attributes: [NSAttributedString.Key.font : UIFont(name: Constant.Font.nunitoSemiBold, size: 13) ?? UIFont.systemFont(ofSize: 13, weight: .semibold), .foregroundColor: Constant.Color.green])
        
        imgSeeAll.image = UIImage(named: Constant.Image.seeAll)
        imgSeeAll.contentMode = .scaleAspectFit
        imgSeeAll.style.preferredSize = CGSize(width: 16, height: 16)
        
        
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let stackSeeAll = ASStackLayoutSpec(direction: .horizontal, spacing: 2, justifyContent: .center, alignItems: .center, children: [textSeeAll, imgSeeAll])
        
        let absoluteTitle = ASAbsoluteLayoutSpec(children: [textTitle, stackSeeAll])
        
        textTitle.style.layoutPosition =  CGPoint(x: 16, y: 0)
        stackSeeAll.style.layoutPosition = CGPoint(x: constrainedSize.max.width - Constant.Size.spacingButtonSeeAll - Constant.Size.buttonSeeAllWidth, y: 0)
        
        let stackCell = ASStackLayoutSpec(direction: .vertical, spacing: 16, justifyContent: .start, alignItems: .start, children: [absoluteTitle, collectionNode])
        stackCell.style.preferredSize = CGSize(width: constrainedSize.max.width, height: Constant.Size.doctorTableCellHeight)
        return ASInsetLayoutSpec(insets: .zero, child: stackCell)
    }
   
    
}

//MARK: ASCollectionDelegate
extension DoctorTableCellNode: ASCollectionDelegate {
    func collectionNode(_ collectionNode: ASCollectionNode, constrainedSizeForItemAt indexPath: IndexPath) -> ASSizeRange {
        return ASSizeRange(min: CGSize(width: 0, height: 0), max: CGSize(width: Constant.Size.doctorCollectionCellWidth, height: Constant.Size.doctorCollectionCellMaxHeight))
    }
}


//MARK: ASCollectionDataSource
extension DoctorTableCellNode: ASCollectionDataSource {
    func numberOfSections(in collectionNode: ASCollectionNode) -> Int {
        return 1
    }
    
    func collectionNode(_ collectionNode: ASCollectionNode, numberOfItemsInSection section: Int) -> Int {
        return doctorList?.count ?? 0
    }
    
    func collectionNode(_ collectionNode: ASCollectionNode, nodeBlockForItemAt indexPath: IndexPath) -> ASCellNodeBlock {
        return { [weak self] in
            let cell = DoctorCollectionCellNode()
            cell.clipsToBounds = false
            if let self = self {
                if let doctorList = self.doctorList {
                    let doctor = doctorList[indexPath.item]
                    cell.nodeDoctor.configViews(doctorInfo: doctor)
                    return cell
                }
            }
           return cell
        }
        
    }
}


