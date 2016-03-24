//
//  RMTabBarViewController.swift
//  RightMeowTV
//
//  Created by Johann Kerr on 2/18/16.
//  Copyright © 2016 Swarm. All rights reserved.
//

import UIKit

class RMTabBarViewController: UITabBarController, UITabBarControllerDelegate {
    
    lazy var streamViewController: StreamViewController = StreamViewController()
    lazy var aboutViewController: AboutViewController = AboutViewController()
    

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        self.view.backgroundColor = Constants.backgroundColor
        self.view.tintColor = Constants.appColor
        viewControllers = [streamViewController, aboutViewController]
        viewControllers![0].tabBarItem.title = "Stream"
        viewControllers![0].tabBarItem.image = UIImage(named: "contactsIcon")
        
        viewControllers![1].tabBarItem.title = "Messages"
        viewControllers![1].tabBarItem.image = UIImage(named: "messagesIcon")
        
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func loadView() {
        super.loadView();
        self.edgesForExtendedLayout = UIRectEdge.None;
        //        connectToLayer()
        
        
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        
        // Force Landscape Orientation
        let value = UIInterfaceOrientation.Portrait.rawValue
        UIDevice.currentDevice().setValue(value, forKey: "orientation")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


