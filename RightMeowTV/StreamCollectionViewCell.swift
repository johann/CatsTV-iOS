//
//  StreamCollectionViewCell.swift
//  RightMeowTV
//
//  Created by Johann Kerr on 3/23/16.
//  Copyright © 2016 Swarm. All rights reserved.
//

import UIKit
import AVFoundation
import FLAnimatedImage

class StreamCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "StreamCell"
    
    var catImageView: UIImageView = UIImageView()
    var catPlayer: AVPlayerLayer = AVPlayerLayer()
    var catPlayerView: UIView = UIView()
    var loaderImageView: FLAnimatedImageView = FLAnimatedImageView();
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
        setNeedsUpdateConstraints()
        
    }
    func initialize(){
        //catImageView.backgroundColor = UIColor.greenColor()
        //self.addSubview(self.catPlayer)
        self.catPlayer.backgroundColor = UIColor.greenColor().CGColor
//        var filePath = NSBundle.mainBundle().pathForResource("nyancat" + ".gif", ofType: nil)
//        var data = NSData(contentsOfFile: filePath!);
//        let image = FLAnimatedImage(animatedGIFData: data);
//        
//        self.loaderImageView.animatedImage = image
        self.layer.addSublayer(self.catPlayer)
        
        
        //self.addSubview(self.loaderImageView)
        self.addSubview(self.catPlayerView)
        self.catPlayerView.layer.addSublayer(self.catPlayer)
        //self.addSubview(self.catImageView)
        
        
        NSNotificationCenter.defaultCenter().addObserver(self,
            selector: "replayLoop",
            name: AVPlayerItemDidPlayToEndTimeNotification,
            object: self.catPlayer.player)
    }
    
    override func updateConstraints(){
        dispatch_async(dispatch_get_main_queue()) {
            self.createConstraints()
        }
        
        super.updateConstraints()
    }
    func replayLoop(){
        let seconds : Int64 = 0
        let preferredTimeScale : Int32 = 1
        let seekTime : CMTime = CMTimeMake(seconds, preferredTimeScale)
        self.catPlayer.player!.seekToTime(seekTime)
        self.catPlayer.player!.play()
    }
    func replay(){
        let seconds : Int64 = 0
        let preferredTimeScale : Int32 = 1
        let seekTime : CMTime = CMTimeMake(seconds, preferredTimeScale)
        self.catPlayer.player!.seekToTime(seekTime)
        self.catPlayer.player!.play()
     
    }
    func createConstraints(){
        
        self.catPlayerView.snp_makeConstraints{(make) -> Void in
            make.edges.equalTo(self)
            
        }
//        self.loaderImageView.snp_makeConstraints{(make) -> Void in
//            make.edges.equalTo(self)
//            
//        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
}
