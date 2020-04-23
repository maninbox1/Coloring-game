//
//  Model.swift
//  Coloring game
//
//  Created by Mikhail Ladutska on 4/17/20.
//  Copyright © 2020 Mikhail Ladutska. All rights reserved.
//

import Foundation

class PictureCategory {
    var title: String?
    var categoryImage: String?
    var imageNames: [PicturesNames]?

    static func fetchCategories() -> [PictureCategory] {

        // first row
        let animals = PictureCategory()
        animals.title = "Animals"
        animals.categoryImage = "animals"

        var animalsImages = [PicturesNames]()

        let animal1 = PicturesNames()
        animal1.imageName = "animals1"

        let animal2 = PicturesNames()
        animal2.imageName = "animals2"

        let animal3 = PicturesNames()
        animal3.imageName = "animals3"

        animalsImages.append(animal1)
        animalsImages.append(animal2)
         animalsImages.append(animal3)

        animals.imageNames = animalsImages

      // second row

        let flowers = PictureCategory()
        flowers.title = "Flowers"
        flowers.categoryImage = "flowers"

        var flowersImages = [PicturesNames]()

        let flower1 = PicturesNames()
        flower1.imageName = "flower1"
        
        let flower2 = PicturesNames()
        flower2.imageName = "flower2"
        
        let flower3 = PicturesNames()
        flower3.imageName = "flower3"

        flowersImages.append(flower1)
        flowersImages.append(flower2)
        flowersImages.append(flower3)

        flowers.imageNames = flowersImages

        // third row

        let birds = PictureCategory()
        birds.title = "Birds"
        birds.categoryImage = "birds"


        var birdsImages = [PicturesNames]()

        let bird1 = PicturesNames()
        bird1.imageName = "flower1"
        
        let bird2 = PicturesNames()
        bird2.imageName = "animals1"
        
        let bird3 = PicturesNames()
        bird3.imageName = "flower2"

        birdsImages.append(bird1)
        birdsImages.append(bird2)
        birdsImages.append(bird3)

        birds.imageNames = birdsImages
        
        return [animals, flowers, birds]

    }

}


class PicturesNames {
    var imageName: String?
}
