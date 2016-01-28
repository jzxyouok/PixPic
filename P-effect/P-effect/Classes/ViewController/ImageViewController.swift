//
//  ImageViewController.swift
//  P-effect
//
//  Created by Illya on 1/26/16.
//  Copyright © 2016 Yalantis. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
    
    var model: ImageViewModel!
    
    @IBOutlet private weak var rawImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       rawImage.image = model.originalImage()
        // Do any additional setup after loading the view.
    }
    
}

extension ImageViewController: PhotoEditorDelegate {
    
    func photoEditor(photoEditor: PhotoEditorViewController, didChooseEffect: UIImage) {
        let userResizableView = EffectEditorView(image: didChooseEffect)
        userResizableView.center = rawImage.center
        rawImage.addSubview(userResizableView)
    }
    
    func photoEditor(photoEditor: PhotoEditorViewController, didAskForImageWithEffect: Bool) -> UIImage {
        print("apply choosed effect on image")
        return UIImage(named: "edit_50")!
    }

}