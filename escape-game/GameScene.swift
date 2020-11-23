//
//  GameScene.swift
//  escape-game
//
//  Created by 高橋星輝 on 2020/11/19.
//

import SpriteKit
import GameplayKit
let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate

var itemBar1 = appDelegate.itemBar1
var itemBar2 = appDelegate.itemBar2
let itemSquares = appDelegate.itemSquares
var key = appDelegate.key
var flag = appDelegate.flag

class GameScene: SKScene {
    var door = SKShapeNode()
    
//メイン画面の設定
    func mainView() {
        let floor = SKSpriteNode(imageNamed: "リビング")
        floor.position = CGPoint(x: 0, y: 20)
        floor.zPosition = 0
        floor.size = CGSize(width: 770, height: 450)
        addChild(floor)
    }
//カギアイテムの設定
    func keyItem() {
        key = SKSpriteNode(imageNamed: "カギ")
        key.position = CGPoint(x: 0, y: -70)
        key.zPosition = 3
        key.zRotation = 45
        key.size = CGSize(width: 25, height: 50)
        key.name = "key"
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
        self.keyItem()
        self.touchDoor()
    //ドアのタッチ範囲の表示
        addChild(self.door)
    //アイテム欄の設定
        let itemBar = SKSpriteNode()
        itemBar.size = CGSize(width: 80, height: 80)
        itemBar.position = CGPoint(x: -300, y: -120)
    //アイテム欄の表示
        itemBar1 = SKSpriteNode(imageNamed: itemSquares[0])
        itemBar1.size = itemBar.size
        itemBar1.position = itemBar.position
        itemBar1.zPosition = 1
        itemBar1.name = "itemBar1"
        addChild(itemBar1)
        
        itemBar2 = SKSpriteNode(imageNamed: itemSquares[1])
        itemBar2.size = itemBar.size
        itemBar2.position = itemBar.position
        itemBar2.zPosition = 0
        itemBar2.name = "itemBar2"
        addChild(itemBar2)
    //鍵の表示
        if flag == 1 {
            key.position = itemBar1.position
        }
        addChild(key)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touche = touches.first as UITouch? {
            let location = touche.location(in: self)
            let toucheNode = self.atPoint(location)
            Swift.print(location)
        //アイテム選択
            if key.position == itemBar1.position &&
            toucheNode.name == "itemBar1" ||
            toucheNode.name == "itemBar2" ||
            toucheNode.name == "key" {
                itemBar2.zPosition = 2
            }
            else {
                itemBar2.zPosition = 0
            }
        //鍵の取得
            if toucheNode.name == "key" {
                key.position = itemBar1.position
                flag = 1
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
