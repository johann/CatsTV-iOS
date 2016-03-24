//
//  StreamCollectionViewCell.swift
//  RightMeowTV
//
//  Created by Johann Kerr on 3/23/16.
//  Copyright © 2016 Swarm. All rights reserved.
//

import UIKit
import AVFoundation

class StreamCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "StreamCell"
    
    var catImageView: UIImageView = UIImageView()
    var catPlayer: AVPlayerLayer = AVPlayerLayer()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
        setNeedsUpdateConstraints()
        
    }
    func initialize(){
        catImageView.backgroundColor = UIColor.greenColor()
        self.addSubview(self.catPlayer)
        self.addSubview(self.catImageView)
    }
    
    override func updateConstraints(){
        createConstraints()
        super.updateConstraints()
    }
    
    func createConstraints(){
        self.catImageView.snp_makeConstraints{(make) -> Void in
            make.edges.equalTo(self)
            
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
}
