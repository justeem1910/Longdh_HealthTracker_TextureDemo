//
//  DoctorCollectionCell.swift
//  Longdh_HealthTracker_TextureDemo
//
//  Created by Hoang Long on 29/07/2022.
//

import AsyncDisplayKit

class NodeDoctor: ASDisplayNode {
    var imgDoctor = ASNetworkImageNode()
    var textName = ASTextNode()
    var textSpecial = ASTextNode()
    var imgStar = ASImageNode()
    var textVote = ASTextNode()
    
    override init() {
        super.init()
        automaticallyManagesSubnodes = true
        backgroundColor = .white
        clipsToBounds = false
        setView()
    }
    func setView(){
        imgDoctor.style.preferredSize = CGSize(width: Constant.Size.imageDoctorCellWidth, height: Constant.Size.imageDoctorCellHeight)
        imgDoctor.contentMode = .scaleAspectFill
        imgStar.image = UIImage(named: Constant.Image.star)
        imgStar.style.preferredSize = CGSize(width: Constant.Size.imageStarCellWidth, height: Constant.Size.imageStarCellHeight)
        imgDoctor.cornerRadius = 6
        textName.style.width = ASDimensionMake(Constant.Size.textDoctorCellWidth)
        textName.maximumNumberOfLines = 1
        textName.maximumNumberOfLines = 1
        

    }
    
    func configViews(doctorInfo: DoctorHomeModel?) {
        let imageURL = doctorInfo?.avatar
        let name = doctorInfo?.full_name
        let major = doctorInfo?.majors_name
        let star = doctorInfo?.ratio_star
        let numberOfReviews = doctorInfo?.number_of_reviews
        
        configViews(imageURLStr: imageURL, name: name, major: major, star: star, numberOfReviews: numberOfReviews)
    }
    
    private func configViews(imageURLStr: String?, name: String?, major: String?, star: Double?, numberOfReviews: Int?) {

        if (imageURLStr ?? "") == "" {
            imgDoctor.image = UIImage(named: Constant.Image.doctor)
        } else {
            imgDoctor.url = URL(string: imageURLStr ?? " ")
        }
        
        textName.attributedText = NSAttributedString(string: name ?? " ", attributes: [NSAttributedString.Key.font : UIFont(name: Constant.Font.nunitoBold, size: 13) ?? UIFont.boldSystemFont(ofSize: 13), .foregroundColor: Constant.Color.gray1])
        textSpecial.attributedText = NSAttributedString(string: major ?? " ", attributes: [NSAttributedString.Key.font : UIFont(name: Constant.Font.nunitoRegular, size: 12) ?? UIFont.systemFont(ofSize: 12, weight: .regular), .foregroundColor: Constant.Color.gray3])
        
        let font = UIFont(name: Constant.Font.nunitoRegular, size: 11)
        let headColor = Constant.Color.gray1
        let tailColor = Constant.Color.gray3
        textVote.attributedText = NSMutableAttributedString()
            .attrStr(text: String(format: "%.1f", star ?? 0), font: font, textColor: headColor)
            .attrStr(text: " (\(numberOfReviews ?? 0))", font: font, textColor: tailColor)
        
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        
        let stackVote = ASStackLayoutSpec(direction: .horizontal, spacing: 6, justifyContent: .start, alignItems: .start, children: [imgStar, textVote])
        
        let stackNameAndSpecial = ASStackLayoutSpec(direction: .vertical, spacing: 4, justifyContent: .start, alignItems: .start, children: [textName, textSpecial])
        
        let stackNameAndVote = ASStackLayoutSpec(direction: .vertical, spacing: 8, justifyContent: .start, alignItems: .start, children: [stackNameAndSpecial, stackVote])
        
        let stackCell = ASStackLayoutSpec(direction: .vertical, spacing: 12, justifyContent: .start, alignItems: .start, children: [imgDoctor, stackNameAndVote])
        
        let insetCell = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12), child: stackCell)
        

        return insetCell
    }
}
