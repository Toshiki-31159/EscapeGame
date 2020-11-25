//
//  File.swift
//  escape-game
//
//  Created by 高橋星輝 on 2020/11/20.
//

import Foundation
import SpriteKit
import GameplayKit

class Door: SKScene {
    var backButton = SKSpriteNode()
    
    override func didMove(to view: SKView) {
    //アイテム欄とアイテムの表示
        addChild(itemBar1_1)
        addChild(itemBar1_2)
        addChild(itemBar2_1)
        addChild(itemBar2_2)
        addChild(key1)
        addChild(key2)
    //ドアの表示
        let door = SKSpriteNode(imageNamed: "ドア")
        door.zPosition = 0
        door.size = CGSize(width: 300, height: 400)
        door.name = "door"
        addChild(door)
    //バックボタンの表示
        self.backButton = SKSpriteNode(imageNamed: "青矢印バック")
        self.backButton.zPosition = 1
        self.backButton.size = CGSize(width: 50, height: 50)
        self.backButton.position = CGPoint(x: 300, y: -130)
        self.backButton.name = "backButton"
        addChild(backButton)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touche = touches.first as UITouch? {
            let location = touche.location(in: self)
            let toucheNode = self.atPoint(location)
            
        //アイテムの選択
            if keyFlag1 == 3 && toucheNode.name == "key1" ||
            toucheNode.name == "itemBar2_1" {
                itemBar2_2.zPosition = 2
            }
            else if keyFlag1 != 3 || toucheNode.name != "door" {
                itemBar2_2.zPosition = 0
            }
            if keyFlag2 == 3 && toucheNode.name == "key2" ||
            toucheNode.name == "itemBar1_1" {
                itemBar1_2.zPosition = 2
            }
            else {
                itemBar1_2.zPosition = 0
            }
        //ゲームクリア画面への遷移
            if toucheNode.name == "door" && itemBar2_2.zPosition == 2 && keyFlag1 == 3 {
                let scene = Clear(fileNamed: "clearView")
                let transition = SKTransition.fade(withDuration: 2.0)
                scene?.scaleMode = SKSceneScaleMode.aspectFill
                self.view!.presentScene(scene!, transition: transition)
            }
        //リビングへ戻る
            if toucheNode.name == "backButton" {
                let scene = GameScene(fileNamed: "GameScene")
                let transition = SKTransition.fade(withDuration: 0.5)
                scene?.scaleMode = SKSceneScaleMode.aspectFill
                self.view!.presentScene(scene!, transition: transition)
            }
        }
    }
}
