//
//  AppDelegate.swift
//  escape-game
//
//  Created by 高橋星輝 on 2020/11/19.
//

import UIKit
import SpriteKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
//アイテム欄
    let itemBar = ["アイテム枠", "アイテム枠選択"]
    var itemBar1_1 = SKSpriteNode()
    var itemBar1_2 = SKSpriteNode()
    var itemBar2_1 = SKSpriteNode()
    var itemBar2_2 = SKSpriteNode()
//カギとメモ
    let items = ["かみ","カギ","金のカギ"]
    var memo = SKSpriteNode()
    var key1 = SKSpriteNode()
    var key2 = SKSpriteNode()
//フラグ
    var keyFlag1 = 0
    var keyFlag2 = 0
    var treasureFlag = 0

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        sleep(1)
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }


}

