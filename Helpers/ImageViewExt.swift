//
//  ImageViewExt.swift
//  Coloring game
//
//  Created by Mikhail Ladutska on 4/20/20.
//  Copyright © 2020 Mikhail Ladutska. All rights reserved.
//

import UIKit

extension UIImageView {
    var contentClippingRect: CGRect {
        let imageViewSize = bounds.size
        let imgSize = image?.size
        
        guard let imageSize = imgSize else {
            return CGRect.zero
        }
        
        let scaleWidth = imageViewSize.width / imageSize.width
        let scaleHeight = imageViewSize.height / imageSize.height
        let aspect = fmin(scaleWidth, scaleHeight)
        
        var imageRect = CGRect(x: 0, y: 0, width: imageSize.width * aspect, height: imageSize.height * aspect)
        // Center image
        imageRect.origin.x = (imageViewSize.width - imageRect.size.width) / 2
        imageRect.origin.y = (imageViewSize.height - imageRect.size.height) / 2
        return imageRect
    }
}
