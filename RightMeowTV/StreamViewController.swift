//
//  StreamViewController.swift
//  RightMeowTV
//
//  Created by Johann Kerr on 2/18/16.
//  Copyright © 2016 Swarm. All rights reserved.
//

import UIKit
import SVProgressHUD
import Haneke
import AVKit
import Foundation
import AVFoundation
import SnapKit

class StreamViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate{
    
    
    var streamView = StreamView()
    var cats = [Entry]()
    var playerArray = [AVPlayerItem]()
    var player = AVPlayer()
    
    
   
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        print("Explore loaded")
        
        
        streamView.collectionView.delegate = self
        streamView.collectionView.dataSource = self
        
        
        self.streamView.collectionView.backgroundColor = UIColor.clearColor()
        self.loadCollectionViewData()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        

        
        self.navigationController?.navigationBarHidden = false
        self.navigationController?.navigationBar.topItem!.title = "CatsTV"
        self.navigationController?.navigationBar.tintColor = Constants.appColor
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: Constants.appColor]
        
        
        
        
        let bkTabBarController = self.tabBarController as! RMTabBarViewController
        
    }
    
    
    
    override func loadView() {
        super.loadView()
        view = streamView
    }
    
    
    
    
    func loadLocalCollectionViewData(){
        
        
    }
    
    func loadCollectionViewData(){
        SVProgressHUD.show()
        EntryService.FetchAsnyc {
            entries in
            for entry in entries {
                
                print(entry.ImgUrl)
                if entry.ImgUrl.containsString("giphy"){
                   print("handle giphy")
                }else{
                   self.cats.append(entry)
                }
                
//                
//                let checkUrl = NSURL(string:entry.ImgUrl)
//                if checkUrl!.pathExtension!.lowercaseString != "mp4"{
//                    print("Error -> \(checkUrl!)")
//                }else{
//                    
//                    
//                    var player = AVPlayerItem(URL:NSURL(string:entry.ImgUrl)!)
//                    self.playerArray.append(player)
//                   
//                    
//                }
                
            }
        
           
            self.streamView.collectionView.reloadData()

        }
        
        SVProgressHUD.dismiss()
        self.streamView.collectionView.reloadData()

        
    }
    func replayLoop(sender: AnyObject){
        let seconds : Int64 = 0
        let preferredTimeScale : Int32 = 1
        let seekTime : CMTime = CMTimeMake(seconds, preferredTimeScale)
        self.player.seekToTime(seekTime)
        self.player.play()
        
        // self.replayPlayer.seekToTime(seekTime)
        // self.replayPlayer.play()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("StreamCell", forIndexPath: indexPath) as! StreamCollectionViewCell
        //cell.backgroundColor = UIColor.greenColor()

        
        
        
        
        if self.cats.count != 0{
            var url = self.cats[indexPath.row].ImgUrl
            var playerItem = AVPlayerItem(URL: NSURL(string: url)!)
       
            cell.setCell(playerItem)
            
//            NSNotificationCenter.defaultCenter().addObserver(self,
//                                selector: "replayLoop:",
//                                name: AVPlayerItemDidPlayToEndTimeNotification,
//                                object: playerItem)
                        
//            cell.loaderImageView.loopCompletionBlock = {
//                num in
//                cell.loaderImageView.stopAnimating();
//            }

        }else{
            print("empty")
        }
        
        //cell.catPlayer.frame = CGRectMake(0,0,UIScreen.mainScreen().bounds.width-Constants.padding,UIScreen.mainScreen().bounds.height/2 - 100)
        cell.catPlayer.videoGravity = AVLayerVideoGravityResizeAspectFill
        cell.catPlayer.backgroundColor = UIColor.blackColor().CGColor
       

        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, willDisplayCell cell: UICollectionViewCell, forItemAtIndexPath indexPath: NSIndexPath) {
        if self.cats.count - indexPath.row == 5{
            EntryService.FetchMoreAsnyc {
                entries in
                for entry in entries {
                    
                    print(entry.ImgUrl)
                    if entry.ImgUrl.containsString("giphy"){
                        print("handle giphy")
                    }else{
                        self.cats.append(entry)
                    }
                }
            }
    
            //self.streamView.collectionView.reloadData()
        }
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("StreamCell", forIndexPath: indexPath) as! StreamCollectionViewCell

        
        
        
        
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.cats.count
    }
    
    
    
    


}
