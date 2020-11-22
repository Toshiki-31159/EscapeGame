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
    
    override func didMove(to view: SKView) {
    //ドアの表示
        let door = SKSpriteNode(imageNamed: "ドア")
        door.size = CGSize(width: 300, height: 400)
        door.name = "door"
        addChild(door)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touche = touches.first as UITouch? {
            let location = touche.location(in: self)
            let toucheNode = self.atPoint(location)
            
        //ゲームクリア画面への遷移
            if toucheNode.name == "door" {
                let scene = Clear(fileNamed: "clearView")
                let transition = SKTransition.fade(withDuration: 2.0)
                scene?.scaleMode = SKSceneScaleMode.aspectFill
                self.view!.presentScene(scene!, transition: transition)
            }
        }
    }
}
