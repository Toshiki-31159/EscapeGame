//
//  GameScene.swift
//  escape-game
//
//  Created by 高橋星輝 on 2020/11/19.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    override func didMove(to view: SKView) {
    //リビングのサイズ、位置設定
        let floor = SKSpriteNode(imageNamed: "リビング")
        floor.position = CGPoint(x: 0, y: 20)
        floor.zPosition = 0
        floor.size = CGSize(width: 770, height: 450)
        addChild(floor)
    //鍵のサイズ、位置設定
        let key = SKSpriteNode(imageNamed: "カギ")
        key.position = CGPoint(x: 0, y: -70)
        key.zPosition = 1
        key.zRotation = 45
        key.size = CGSize(width: 25, height: 50)
        addChild(key)

    }
    
    
    func touchDown(atPoint pos : CGPoint) {
    }
    
    func touchMoved(toPoint pos : CGPoint) {
    }
    
    func touchUp(atPoint pos : CGPoint) {
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
