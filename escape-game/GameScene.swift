//
//  GameScene.swift
//  escape-game
//
//  Created by 高橋星輝 on 2020/11/19.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    var itemSquare = SKSpriteNode()
    var key = SKSpriteNode()
    var door = SKShapeNode()
    
    
//メイン画面の設定
    func mainView() {
        let floor = SKSpriteNode(imageNamed: "リビング")
        floor.position = CGPoint(x: 0, y: 20)
        floor.zPosition = 0
        floor.size = CGSize(width: 770, height: 450)
        addChild(floor)
    }
//アイテム枠の設定
    func itemBar() {
        self.itemSquare = SKSpriteNode(imageNamed: "アイテム枠")
        self.itemSquare.position = CGPoint(x: -300, y: -120)
        self.itemSquare.zPosition = 1
        self.itemSquare.size = CGSize(width: 80, height: 80)
        self.itemSquare.name = "itemBar"
        }
//カギアイテムの設定
    func item() {
        self.key = SKSpriteNode(imageNamed: "カギ")
        self.key.position = CGPoint(x: 0, y: -70)
        self.key.zPosition = 2
        self.key.zRotation = 45
        self.key.size = CGSize(width: 25, height: 50)
        self.key.name = "key"
    }
//ドアのアクション範囲設定
    func touchDoor() {
        self.door = SKShapeNode(rect: CGRect(x: 288, y: -123,
                                             width: 77, height: 280))
        self.door.fillColor = UIColor.white
        self.door.alpha = 0.01
        self.door.zPosition = 1
        self.door.name = "door"
    }
    
    override func didMove(to view: SKView) {
    //各設定の呼び出し
        self.mainView()
        self.itemBar()
        self.item()
        self.touchDoor()
    //鍵の表示
        addChild(self.key)
    //アイテム枠の表示
        addChild(self.itemSquare)
    //ドアのタッチ範囲の表示
        addChild(door)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touche = touches.first as UITouch? {
            let location = touche.location(in: self)
            let toucheNode = self.atPoint(location)
            Swift.print(location)
        //鍵の取得
            if toucheNode.name == "key" {
                self.key.position = self.itemSquare.position
            }
        //ドアの画面に遷移
            if toucheNode.name == "door" {
                let scene = Door(fileNamed: "door")
                let transition = SKTransition.fade(withDuration: 0.5)
                scene?.scaleMode = SKSceneScaleMode.aspectFill
                self.view!.presentScene(scene!, transition: transition)
                }
            }
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
