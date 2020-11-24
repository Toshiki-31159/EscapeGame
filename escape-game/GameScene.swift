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
var controller = appDelegate.controller
var flag1 = appDelegate.flag1

class GameScene: SKScene {
    var floor = SKSpriteNode()
    var door = SKShapeNode()
    var touchsofa = SKShapeNode()
    var sofa = SKSpriteNode()
    var backButton = SKSpriteNode()
    var password1 = SKSpriteNode()
    var password2 = SKSpriteNode()
    var password3 = SKSpriteNode()
    
//メイン画面の設定
    func mainView() {
        self.floor = SKSpriteNode(imageNamed: "リビング")
        self.floor.position = CGPoint(x: 0, y: 20)
        self.floor.zPosition = 0
        self.floor.size = CGSize(width: 770, height: 450)
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
        self.touchsofa = SKShapeNode(rect: CGRect(x: -220, y: -167,
                                             width: 100, height: 120))
        self.touchsofa.fillColor = UIColor.white
        self.touchsofa.alpha = 0.01
        self.touchsofa.zPosition = 1
        self.touchsofa.name = "touchsofa"
    }
//ソファの表示設定
    func displaySofa() {
        self.sofa = SKSpriteNode(imageNamed: "ソファ")
        self.sofa.position = CGPoint(x: 0, y: -50)
        self.sofa.zPosition = -1
        self.sofa.size = CGSize(width: 400, height: 200)
    }
//リモコンのサイズ、位置設定
    func controllerItem() {
        controller = SKSpriteNode(imageNamed: "リモコン")
        controller.position = CGPoint(x: 40, y: -80)
        controller.zPosition = 3
        controller.zRotation = 0.25
        controller.size = CGSize(width: 20, height: 50)
        controller.name = "controller"
    }
//バックボタンの表示
    func BuckButton() {
        self.backButton = SKSpriteNode(imageNamed: "青矢印バック")
        self.backButton.zPosition = -1
        self.backButton.size = CGSize(width: 50, height: 50)
        self.backButton.position = CGPoint(x: 300, y: -130)
        self.backButton.name = "backButton"
    }
    
    override func didMove(to view: SKView) {
    //各設定の呼び出し
        self.mainView()
        self.touchDoor()
        self.touchesSofa()
        self.controllerItem()
        self.displaySofa()
        self.BuckButton()
    //各タッチ範囲、リビングの表示
        addChild(self.floor)
        addChild(self.door)
        addChild(self.touchsofa)
        addChild(self.sofa)
        addChild(self.backButton)
    
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
    //暗号の設定
        let password = SKSpriteNode()
        password.size = CGSize(width: 50, height: 50)
        password.zPosition = -1
    //暗号の表示
        self.password1 = SKSpriteNode(imageNamed: "サイコロ6")
        self.password1.size = password.size
        self.password1.position = CGPoint(x: -110, y: 0)
        self.password1.zPosition = password.zPosition
        addChild(self.password1)
        
        self.password2 = SKSpriteNode(imageNamed: "サイコロ3")
        self.password2.size = password.size
        self.password2.position = CGPoint(x: 0, y: 0)
        self.password2.zPosition = password.zPosition
        addChild(self.password2)
        
        self.password3 = SKSpriteNode(imageNamed: "サイコロ5")
        self.password3.size = password.size
        self.password3.position = CGPoint(x: 110, y: 0)
        self.password3.zPosition = password.zPosition
        addChild(self.password3)
    //リモコンの表示
        if flag1 == 1 {
            controller.position = itemBar1_1.position
        }
        self.addChild(controller)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touche = touches.first as UITouch? {
            let location = touche.location(in: self)
            let toucheNode = self.atPoint(location)
            Swift.print(location)
        //アイテム選択
            if controller.position == itemBar1_1.position &&
            toucheNode.name == "itemBar1_1" ||
            toucheNode.name == "itemBar1_2" ||
            toucheNode.name == "controller" {
                itemBar1_2.zPosition = 2
            }
            else {
                itemBar1_2.zPosition = 0
            }
        //リモコンの取得
            if toucheNode.name == "controller" {
                controller.position = itemBar1_1.position
                controller.zRotation = 0
                flag1 = 1
            }
        //ドアの画面に遷移
            if toucheNode.name == "door" &&
                self.sofa.zPosition == -1 {
                self.removeAllChildren()
                let scene = Door(fileNamed: "door")
                let transition = SKTransition.fade(withDuration: 0.5)
                scene?.scaleMode = SKSceneScaleMode.aspectFill
                self.view!.presentScene(scene!, transition: transition)
            }
        //ソファと暗号の表示
            if toucheNode.name == "touchsofa" {
                self.sofa.zPosition = 4
                self.backButton.zPosition = 4
                self.password1.zPosition = 5
                self.password2.zPosition = 5
                self.password3.zPosition = 5
            }
            else if toucheNode.name == "backButton" {
                self.sofa.zPosition = -1
                self.backButton.zPosition = -1
                self.password1.zPosition = -1
                self.password2.zPosition = -1
                self.password3.zPosition = -1
            }
        }
    }
}
