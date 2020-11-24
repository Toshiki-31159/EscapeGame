//
//  GameScene.swift
//  escape-game
//
//  Created by 高橋星輝 on 2020/11/19.
//

import SpriteKit
import GameplayKit
let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
//アイテム欄
let itemBar = appDelegate.itemBar
var itemBar1_1 = appDelegate.itemBar1_1
var itemBar1_2 = appDelegate.itemBar1_2
var itemBar2_1 = appDelegate.itemBar2_1
var itemBar2_2 = appDelegate.itemBar2_2
//カギとメモ
let items = appDelegate.items
var memo = appDelegate.memo
var key1 = appDelegate.key1
var key2 = appDelegate.key2
//フラグ
var memoFlag = appDelegate.memoFlag
var keyFlag1 = appDelegate.keyFlag1
var keyFlag2 = appDelegate.keyFlag2
var itemBarFlag1 = appDelegate.itemBarFlag1
var itemBarFlag2 = appDelegate.itemBarFlag2

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
    var TVFlag1 = 0
    var TVFlag2 = 0
    var treasureFlag = 0
    var powerButton = SKShapeNode()
    var Button1 = SKShapeNode()
    var Button2 = SKShapeNode()
    var Button3 = SKShapeNode()
    var Button4 = SKShapeNode()
    var Button5 = SKShapeNode()
    var Button6 = SKShapeNode()
    var Button7 = SKShapeNode()

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
//アイテム欄の設定
    func Bar() {
        itemBar1_1 = SKSpriteNode(imageNamed: itemBar[0])
        itemBar1_1.size = CGSize(width: 80, height: 80)
        itemBar1_1.position = CGPoint(x: -300, y: -120)
        itemBar1_1.zPosition = 1
        itemBar1_1.name = "itemBar1_1"
        
        itemBar1_2 = SKSpriteNode(imageNamed: itemBar[1])
        itemBar1_2.size = itemBar1_1.size
        itemBar1_2.position = itemBar1_1.position
        itemBar1_2.zPosition = 0
        itemBar1_2.name = "itemBar1_2"
        
        itemBar2_1 = SKSpriteNode(imageNamed: itemBar[0])
        itemBar2_1.size = itemBar1_1.size
        itemBar2_1.position = CGPoint(x: -300, y: -40)
        itemBar2_1.zPosition = itemBar1_1.zPosition
        itemBar2_1.name = "itemBar2_1"
        
        itemBar2_2 = SKSpriteNode(imageNamed: itemBar[1])
        itemBar2_2.size = itemBar1_1.size
        itemBar2_2.position = itemBar2_1.position
        itemBar2_2.zPosition = itemBar1_2.zPosition
        itemBar2_2.name = "itemBar2_2"
    }
//リモコンボタンのアクション範囲設定
    func button () {
        self.powerButton = SKShapeNode(rect: CGRect(x: 33, y: -44,
                                                    width: 45, height: 28))
        self.powerButton.fillColor = UIColor.white
        self.powerButton.alpha = 0.5
        self.powerButton.zPosition = -1
        
        self.Button1 = SKShapeNode(rect: CGRect(x: -77, y: -100,
                                               width: 45, height: 28))
        self.Button1.fillColor = self.powerButton.fillColor
        self.Button1.alpha = self.powerButton.alpha
        self.Button1.zPosition = self.powerButton.zPosition
        
        self.Button2 = SKShapeNode(rect: CGRect(x: -22, y: -100,
                                                width: 45, height: 28))
        self.Button2.fillColor = self.powerButton.fillColor
        self.Button2.alpha = self.powerButton.alpha
        self.Button2.zPosition = self.powerButton.zPosition
        
        self.Button3 = SKShapeNode(rect: CGRect(x: 33, y: -100,
                                                width: 45, height: 28))
        self.Button3.fillColor = self.powerButton.fillColor
        self.Button3.alpha = self.powerButton.alpha
        self.Button3.zPosition = self.powerButton.zPosition
        
        self.Button4 = SKShapeNode(rect: CGRect(x: -77, y: -130,
                                                width: 45, height: 28))
        self.Button4.fillColor = self.powerButton.fillColor
        self.Button4.alpha = self.powerButton.alpha
        self.Button4.zPosition = self.powerButton.zPosition
        
        self.Button5 = SKShapeNode(rect: CGRect(x: -22, y: -130,
                                                width: 45, height: 28))
        self.Button5.fillColor = self.powerButton.fillColor
        self.Button5.alpha = self.powerButton.alpha
        self.Button5.zPosition = self.powerButton.zPosition
        
        self.Button6 = SKShapeNode(rect: CGRect(x: 33, y: -130,
                                                width: 45, height: 28))
        self.Button6.fillColor = self.powerButton.fillColor
        self.Button6.alpha = self.powerButton.alpha
        self.Button6.zPosition = self.powerButton.zPosition
        
        self.Button7 = SKShapeNode(rect: CGRect(x: -77, y: -160,
                                                width: 155, height: 28))
        self.Button7.fillColor = self.powerButton.fillColor
        self.Button7.alpha = self.powerButton.alpha
        self.Button7.zPosition = self.powerButton.zPosition
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
        self.Bar()
        self.button()
    //各タッチ範囲、オブジェクトの表示
        addChild(self.floor)
        addChild(self.backButton)
        addChild(self.door)
        addChild(self.touchsofa1)
        addChild(self.touchsofa2)
        addChild(self.sofa)
        addChild(self.controller)
        addChild(self.password1)
        addChild(self.password2)
        addChild(self.password3)
        addChild(self.treasure1)
        addChild(self.treasure2)
        addChild(itemBar1_1)
        addChild(itemBar1_2)
        addChild(itemBar2_1)
        addChild(itemBar2_2)
        addChild(powerButton)
        addChild(Button1)
        addChild(Button2)
        addChild(Button3)
        addChild(Button4)
        addChild(Button5)
        addChild(Button6)
        addChild(Button7)

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
                self.controller.position = CGPoint(x: 0, y: -250)
                self.controller.zRotation = 0
                self.controller.size = CGSize(width: 200, height: 500)
                self.powerButton.zPosition = 4
                self.Button1.zPosition = 4
                self.Button2.zPosition = 4
                self.Button3.zPosition = 4
                self.Button4.zPosition = 4
                self.Button5.zPosition = 4
                self.Button6.zPosition = 4
                self.Button7.zPosition = 4
                self.backButton.zPosition = 4
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
                self.powerButton.zPosition = -1
                self.Button1.zPosition = -1
                self.Button2.zPosition = -1
                self.Button3.zPosition = -1
                self.Button4.zPosition = -1
                self.Button5.zPosition = -1
                self.Button6.zPosition = -1
                self.Button7.zPosition = -1
            }
        }
    }
}
