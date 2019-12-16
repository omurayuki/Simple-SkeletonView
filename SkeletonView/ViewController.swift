//
//  ViewController.swift
//  SkeletonView
//
//  Created by オムラユウキ on 2019/12/16.
//  Copyright © 2019 オムラユウキ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sampleLable: UILabel! {
        didSet {
            sampleLable.textColor = .black
        }
    }
    
    @IBOutlet weak var sampleLabel2: UILabel! {
        didSet {
            sampleLabel2.textColor = .black
        }
    }
    
    @IBOutlet weak var sampleLabel3: UILabel! {
       didSet {
           sampleLabel3.textColor = .black
       }
    }
    
    @IBOutlet weak var sampleLabel4: UILabel! {
       didSet {
           sampleLabel4.textColor = .black
       }
    }
    
    @IBOutlet weak var sampleLabel5: UILabel! {
       didSet {
           sampleLabel5.textColor = .black
       }
    }
    
    @IBOutlet weak var sampleImage: UIImageView! {
        didSet {
            sampleImage.clipsToBounds = true
            sampleImage.contentMode = .scaleAspectFill
        }
    }
    
    private lazy var skeletonView: SkeletonView = {
        SkeletonView(parentFrame: view.frame, labels: [sampleLable, sampleLabel2, sampleLabel3, sampleLabel4, sampleLabel5], images: [sampleImage])
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(skeletonView)
        startSkeleton()
    }

    func startSkeleton() {
        skeletonView.show()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [unowned self] in
            self.skeletonView.hide()
        }
    }
    @IBAction func startSkeleton(_ sender: Any) {
        startSkeleton()
    }
}
