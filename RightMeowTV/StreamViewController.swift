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
        self.navigationController?.navigationBar.topItem!.title = "Explore"
        self.navigationController?.navigationBar.tintColor = Constants.appColor
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: Constants.appColor]
        
        
        self.loadCollectionViewData()
        
        let bkTabBarController = self.tabBarController as! BKTabBarController
        
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
                self.cats.append(entry)
                
                let checkUrl = NSURL(string:entry.ImgUrl)
                if checkUrl!.pathExtension!.lowercaseString != "mp4"{
                    print("Error -> \(checkUrl!)")
                }else{
                    var player = AVPlayerItem(URL:NSURL(string:entry.ImgUrl)!)
                    self.playerArray.append(player)
                }
            }
            
            print(self.cats.count)
   
        }
        
        SVProgressHUD.dismiss()
        self.streamView.collectionView.reloadData()

        
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

        
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("StreamCell", forIndexPath: indexPath) as! StreamCollectionViewCell

        
        
        
        
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.cats.count
    }
    
    
    
    


}
