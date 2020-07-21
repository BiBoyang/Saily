//
//  SearchResultCellModel.swift
//  Protein
//
//  Created by soulghost on 10/5/2020.
//  Copyright © 2020 Lakr Aream. All rights reserved.
//

import UIKit

class SearchResultCellModel {
    
    var packageRef: PackageStruct
    
    // raw
    var iconEntity: (String?, UIImage?)
    var name: String
    var author: String
    var desc: String
    var keywords: [String]?
    
    // calculated
    var title: NSAttributedString?
    var subtitle: NSAttributedString?
    
    init(withPackageRef ref: PackageStruct, andDescriptionShownInResultView context: String) {
        packageRef = ref
        iconEntity = ref.obtainIconIfExists()
        name = ref.obtainNameIfExists()
        author = ref.obtainAuthorIfExists()
        desc = context
    }
    
    func setup() {
        let keywords = self.keywords ?? []
        
        let titleString = name
        let attributedTitle = NSMutableAttributedString.init(string: titleString, attributes: [.font : UIFont.systemFont(ofSize: 17, weight: .semibold), .foregroundColor: UIColor(named: "G-TextTitle")!])
        makeHighlight(attributedTitle, keywords: keywords)
        self.title = attributedTitle.copy() as? NSAttributedString
        
        let subtitleString = desc
        let attributedSubtitle = NSMutableAttributedString.init(string: subtitleString, attributes: [.font : UIFont.systemFont(ofSize: 15, weight: .semibold), .foregroundColor: UIColor(named: "G-TextSubTitle")!])
        makeHighlight(attributedTitle, keywords: keywords)
        self.subtitle = attributedSubtitle.copy() as? NSAttributedString
    }
    
    func makeHighlight(_ content: NSMutableAttributedString, keywords: [String]) {
        for keyword in keywords {
            let contentOCString = NSString(string: content.string.lowercased())
            let range = contentOCString.range(of: keyword);
            content.addAttribute(.foregroundColor, value: UIColor(named: "G-TextHighlight")!, range: range)
            break
        }
    }
    
    static func viewHeight() -> CGFloat {
        return 60
    }
    
    func viewHeight() -> CGFloat {
        return SearchResultCellModel.viewHeight()
    }
}
