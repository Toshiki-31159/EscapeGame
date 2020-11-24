//
//  GameScene.swift
//  escape-game
//
//  Created by 高橋星輝 on 2020/11/19.
//

import SpriteKit
import GameplayKit
let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate

var itemBar1_1 = appDelegate.itemBar1_1
var itemBar1_2 = appDelegate.itemBar1_2
let itemSquares = appDelegate.itemSquares
var flag1 = appDelegate.flag1

class GameScene: SKScene {
    var floor = SKSpriteNode()
    var backButton = SKSpriteNode()
    var door = SKShapeNode()
    var touchsofa1 = SKShapeNode()
    var touchsofa2 = SKShapeNode()
    var sofa = SKSpriteNode()
    var controller = SKSpriteNode()
    var password1 = SKSpriteNode()
    var password2 = SKSpriteNode()
    var password3 = SKSpriteNode()
    var treasure1 = SKSpriteNode()
    var treasure2 = SKSpriteNode()
    
//メイン画面の設定
    func mainView() {
        self.floor = SKSpriteNode(imageNamed: "リビング")
        self.floor.position = CGPoint(x: 0, y: 20)
        self.floor.zPosition = 0
        self.floor.size = CGSize(width: 770, height: 450)
    }
//バックボタンの設定
    func BuckButton() {
        self.backButton = SKSpriteNode(imageNamed: "青矢印バック")
        self.backButton.zPosition = -1
        self.backButton.size = CGSize(width: 50, height: 50)
        self.backButton.position = CGPoint(x: 300, y: -130)
        self.backButton.name = "backButton"
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
//ソファのアクション範囲設定
    func touchesSofa() {
        self.touchsofa1 = SKShapeNode(rect: CGRect(x: -220, y: -167,
                                             width: 100, height: 120))
        self.touchsofa1.fillColor = UIColor.white
        self.touchsofa1.alpha = 0.01
        self.touchsofa1.zPosition = 1
        self.touchsofa1.name = "touchsofa1"
        
        self.touchsofa2 = SKShapeNode(rect: CGRect(x: 220, y: -167,
                                                  width: -100, height: 160))
        self.touchsofa2.fillColor = self.touchsofa1.fillColor
        self.touchsofa2.alpha = self.touchsofa1.alpha
        self.touchsofa2.zPosition = self.touchsofa1.zPosition
        self.touchsofa2.name = "touchsofa2"
    }
//ソファの設定
    func displaySofa() {
        self.sofa = SKSpriteNode(imageNamed: "ソファ")
        self.sofa.position = CGPoint(x: 0, y: -50)
        self.sofa.zPosition = -1
        self.sofa.size = CGSize(width: 400, height: 200)
    }
//リモコン設定
    func controllerItem() {
        controller = SKSpriteNode(imageNamed: "リモコン")
        controller.position = CGPoint(x: 40, y: -80)
        controller.zPosition = 3
        controller.zRotation = 0.25
        controller.size = CGSize(width: 20, height: 50)
        controller.name = "controller"
    }
//暗号の設定
    func password() {
        self.password1 = SKSpriteNode(imageNamed: "サイコロ6")
        self.password1.size = CGSize(width: 50, height: 50)
        self.password1.position = CGPoint(x: -110, y: 0)
        self.password1.zPosition = -1
            
        self.password2 = SKSpriteNode(imageNamed: "サイコロ3")
        self.password2.size = password1.size
        self.password2.position = CGPoint(x: 0, y: 0)
        self.password2.zPosition = password1.zPosition
            
        self.password3 = SKSpriteNode(imageNamed: "サイコロ5")
        self.password3.size = password1.size
        self.password3.position = CGPoint(x: 110, y: 0)
        self.password3.zPosition = password1.zPosition
    }
//宝箱の設定
    func treasure() {
        self.treasure1 = SKSpriteNode(imageNamed: "宝箱")
        self.treasure1.size = CGSize(width: 80, height: 80)
        self.treasure1.position = CGPoint(x: 0, y: -20)
        self.treasure1.zPosition = -1
        self.treasure1.name = "treasure1"
        
        self.treasure2 = SKSpriteNode(imageNamed: "空宝箱")
        self.treasure2.size = self.treasure1.size
        self.treasure2.position = self.treasure1.position
        self.treasure2.zPosition = self.treasure1.zPosition
        self.treasure2.name = "treasure2"
    }
    
    override func didMove(to view: SKView) {
    //各設定の呼び出し
        self.mainView()
        self.BuckButton()
        self.touchDoor()
        self.touchesSofa()
        self.displaySofa()
        self.controllerItem()
        self.password()
        self.treasure()
    //各タッチ範囲、オブジェクトの表示
        addChild(self.floor)
        addChild(self.backButton)
        addChild(self.door)
        addChild(self.touchsofa1)
        addChild(self.touchsofa2)
        addChild(self.sofa)
        addChild(controller)
        addChild(self.password1)
        addChild(self.password2)
        addChild(self.password3)
        addChild(self.treasure1)
        addChild(self.treasure2)
    
    //アイテム欄の設定
        let itemBar = SKSpriteNode()
        itemBar.size = CGSize(width: 80, height: 80)
        itemBar.position = CGPoint(x: -300, y: -120)
    //アイテム欄の表示
        itemBar1_1 = SKSpriteNode(imageNamed: itemSquares[0])
        itemBar1_1.size = itemBar.size
        itemBar1_1.position = itemBar.position
        itemBar1_1.zPosition = 1
        itemBar1_1.name = "itemBar1_1"
        self.addChild(itemBar1_1)
        
        itemBar1_2 = SKSpriteNode(imageNamed: itemSquares[1])
        itemBar1_2.size = itemBar.size
        itemBar1_2.position = itemBar.position
        itemBar1_2.zPosition = 0
        itemBar1_2.name = "itemBar1_2"
        self.addChild(itemBar1_2)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touche = touches.first as UITouch? {
            let location = touche.location(in: self)
            let toucheNode = self.atPoint(location)
            Swift.print(location)
        //ドアの画面に遷移
            if toucheNode.name == "door" &&
            self.sofa.zPosition == -1 &&
            self.controller.zRotation == 0.25 {
                self.removeAllChildren()
                let scene = Door(fileNamed: "door")
                let transition = SKTransition.fade(withDuration: 0.5)
                scene?.scaleMode = SKSceneScaleMode.aspectFill
                self.view!.presentScene(scene!, transition: transition)
            }
        //リモコンの選択
            if toucheNode.name == "controller" {
                self.controller.position = CGPoint(x: 0, y: -135)
                self.controller.zRotation = 0
                self.controller.size = CGSize(width: 160, height: 400)
                self.backButton.zPosition = 3
            }
        //左ソファと暗号の表示
            if toucheNode.name == "touchsofa1" &&
            self.controller.zRotation == 0.25 &&
            self.sofa.zPosition == -1 {
                self.backButton.zPosition = 3
                self.sofa.zPosition = 4
                self.password1.zPosition = 5
                self.password2.zPosition = 5
                self.password3.zPosition = 5
            }
        //右ソファと宝箱の表示
            if toucheNode.name == "touchsofa2" &&
            self.controller.zRotation == 0.25 &&
            self.sofa.zPosition == -1 {
                self.backButton.zPosition = 3
                self.sofa.zPosition = 4
                self.treasure1.zPosition = 5
            }
        //バックボタンの処理
            if toucheNode.name == "backButton" {
                self.controller.position = CGPoint(x: 40, y: -80)
                self.controller.zRotation = 0.25
                self.controller.size = CGSize(width: 20, height: 50)
                self.sofa.zPosition = -1
                self.password1.zPosition = -1
                self.password2.zPosition = -1
                self.password3.zPosition = -1
                self.treasure1.zPosition = -1
                self.treasure2.zPosition = -1
                self.backButton.zPosition = -1
            }
        }
    }
}
