//
//  ViewController.swift
//  TikTackToe
//
//  Created by Jonathan Ingram on 9/22/21.
//

import UIKit

class ViewController: UIViewController {
    
    
       
    @IBOutlet weak var S1: UIImageView!
    @IBOutlet weak var S2: UIImageView!
    @IBOutlet weak var S3: UIImageView!
    @IBOutlet weak var S4: UIImageView!
    @IBOutlet weak var S5: UIImageView!
    @IBOutlet weak var S6: UIImageView!
    @IBOutlet weak var S7: UIImageView!
    @IBOutlet weak var S8: UIImageView!
    @IBOutlet weak var S9: UIImageView!
    
    
    
    
    
    @IBOutlet weak var whoseTurn: UILabel!
    
    
    let HUMAN_PLAYER = "X"
    let COMPUTER_PLAYER = "O"
    var board: [String] = ["0","1","2","3","4","5","6","7","8"]
    let BOARD_SIZE = 9
    var turn = "X"
    var win = 0
    var move = -1
    
    var currentImage: UIImageView!
    var boardNum: Int!
    
    
    
    
    
    
    @IBAction func NewGame(_ sender: UIButton) {
        S1.image = nil
        S2.image = nil
        S3.image = nil
        S4.image = nil
        S5.image = nil
        S6.image = nil
        S7.image = nil
        S8.image = nil
        S9.image = nil
        
        print("TTT_ACTIVITY: Starting New Game")
        turn = HUMAN_PLAYER
        board = ["0", "1", "2", "3", "4", "5", "6","7", "8"]
    }
    

    override func viewDidLoad() {
       super.viewDidLoad()
        
       
        let tapGesture1 = UITapGestureRecognizer(target: self, action:
                            #selector(ViewController.img1Clicked))
                        
                        tapGesture1.numberOfTapsRequired = 1
                        
                        S1.addGestureRecognizer(tapGesture1)

                        
                // Do any additional setup after loading the view.
        
        let tapGesture2 = UITapGestureRecognizer(target: self, action:
                #selector(ViewController.img2Clicked))
                        
        
                        tapGesture2.numberOfTapsRequired = 1
                        
                        S2.addGestureRecognizer(tapGesture2)
        
        
        let tapGesture3 = UITapGestureRecognizer(target: self, action:
                        #selector(ViewController.img3Clicked))
        
                        tapGesture3.numberOfTapsRequired = 1
                        
                        S3.addGestureRecognizer(tapGesture3)
                        
        
        let tapGesture4 = UITapGestureRecognizer(target: self, action:
                        #selector(ViewController.img4Clicked))
        
        
                        tapGesture4.numberOfTapsRequired = 1
                        
                        S4.addGestureRecognizer(tapGesture4)
        
        let tapGesture5 = UITapGestureRecognizer(target: self, action:
                        #selector(ViewController.img5Clicked))
        
        
                        tapGesture5.numberOfTapsRequired = 1
                        
                        S5.addGestureRecognizer(tapGesture5)
        
        
        let tapGesture6 = UITapGestureRecognizer(target: self, action:
                        #selector(ViewController.img6Clicked))
        
        
                        tapGesture6.numberOfTapsRequired = 1
                        
                        S6.addGestureRecognizer(tapGesture6)
        
        
        let tapGesture7 = UITapGestureRecognizer(target: self, action:
                        #selector(ViewController.img7Clicked))
        
                        tapGesture7.numberOfTapsRequired = 1
                        
                        S7.addGestureRecognizer(tapGesture7)
        
        
        let tapGesture8 = UITapGestureRecognizer(target: self, action:
                        #selector(ViewController.img8Clicked))
        
                        tapGesture8.numberOfTapsRequired = 1
                        
                        S8.addGestureRecognizer(tapGesture8)
        
        
        
        let tapGesture9 = UITapGestureRecognizer(target: self, action:
                        #selector(ViewController.img9Clicked))
        
                    
                        tapGesture9.numberOfTapsRequired = 1
                        
                        S9.addGestureRecognizer(tapGesture9)

                
    }
    
    


    @objc func img1Clicked(){
         // This code is for testing the GUI, will change in real game code
        
            if(turn == HUMAN_PLAYER){
            S1.image = #imageLiteral(resourceName: "x_img.png")
             board[0] = HUMAN_PLAYER
            turn = COMPUTER_PLAYER
                whoseTurn.text = "Computer’s Turn"
                print("TTT_ACTIVITY: ")
                displayBoard()
             }
            else{
            S1.image = #imageLiteral(resourceName: "o_img.png")
             board[0] = COMPUTER_PLAYER
            turn = HUMAN_PLAYER
                self.whoseTurn.text = "Human’s Turn"
                print("TTT_ACTIVITY: ")
                displayBoard()
            }
        }
    
    
    @objc func img2Clicked(){
         // This code is for testing the GUI, will change in real game code
        
            if(turn == HUMAN_PLAYER){
            S2.image = #imageLiteral(resourceName: "x_img.png")
             board[0] = HUMAN_PLAYER
            turn = COMPUTER_PLAYER
                whoseTurn.text = "Computer’s Turn"
                print("TTT_ACTIVITY: ")
                displayBoard()
             }
            else{
            S2.image = #imageLiteral(resourceName: "o_img.png")
             board[0] = COMPUTER_PLAYER
            turn = HUMAN_PLAYER
                self.whoseTurn.text = "Human’s Turn"
                print("TTT_ACTIVITY: ")
                displayBoard()
            }
        }
    
    @objc func img3Clicked(){
         // This code is for testing the GUI, will change in real game code
        
            if(turn == HUMAN_PLAYER){
            S3.image = #imageLiteral(resourceName: "x_img.png")
             board[0] = HUMAN_PLAYER
            turn = COMPUTER_PLAYER
                whoseTurn.text = "Computer’s Turn"
                print("TTT_ACTIVITY: ")
                displayBoard()
             }
            else{
            S3.image = #imageLiteral(resourceName: "o_img.png")
             board[0] = COMPUTER_PLAYER
            turn = HUMAN_PLAYER
                self.whoseTurn.text = "Human’s Turn"
                print("TTT_ACTIVITY: ")
                displayBoard()
            }
        }
    
    @objc func img4Clicked(){
         // This code is for testing the GUI, will change in real game code
        
            if(turn == HUMAN_PLAYER){
            S4.image = #imageLiteral(resourceName: "x_img.png")
             board[0] = HUMAN_PLAYER
            turn = COMPUTER_PLAYER
                whoseTurn.text = "Computer’s Turn"
                print("TTT_ACTIVITY: ")
                displayBoard()
             }
            else{
            S4.image = #imageLiteral(resourceName: "o_img.png")
             board[0] = COMPUTER_PLAYER
            turn = HUMAN_PLAYER
                self.whoseTurn.text = "Human’s Turn"
                print("TTT_ACTIVITY: ")
                displayBoard()
            }
        }
    
    @objc func img5Clicked(){
         // This code is for testing the GUI, will change in real game code
        
            if(turn == HUMAN_PLAYER){
            S5.image = #imageLiteral(resourceName: "x_img.png")
             board[0] = HUMAN_PLAYER
            turn = COMPUTER_PLAYER
                whoseTurn.text = "Computer’s Turn"
                print("TTT_ACTIVITY: ")
                displayBoard()
             }
            else{
            S5.image = #imageLiteral(resourceName: "o_img.png")
             board[0] = COMPUTER_PLAYER
            turn = HUMAN_PLAYER
                self.whoseTurn.text = "Human’s Turn"
                print("TTT_ACTIVITY: ")
                displayBoard()
            }
        }
    
    @objc func img6Clicked(){
         // This code is for testing the GUI, will change in real game code
        
            if(turn == HUMAN_PLAYER){
            S6.image = #imageLiteral(resourceName: "x_img.png")
             board[0] = HUMAN_PLAYER
            turn = COMPUTER_PLAYER
                whoseTurn.text = "Computer’s Turn"
                print("TTT_ACTIVITY: ")
                displayBoard()
             }
            else{
            S6.image = #imageLiteral(resourceName: "o_img.png")
             board[0] = COMPUTER_PLAYER
            turn = HUMAN_PLAYER
                self.whoseTurn.text = "Human’s Turn"
                print("TTT_ACTIVITY: ")
                displayBoard()
            }
        }
    
    @objc func img7Clicked(){
         // This code is for testing the GUI, will change in real game code
        
            if(turn == HUMAN_PLAYER){
            S7.image = #imageLiteral(resourceName: "x_img.png")
             board[0] = HUMAN_PLAYER
            turn = COMPUTER_PLAYER
                whoseTurn.text = "Computer’s Turn"
                print("TTT_ACTIVITY: ")
                displayBoard()
             }
            else{
            S7.image = #imageLiteral(resourceName: "o_img.png")
             board[0] = COMPUTER_PLAYER
            turn = HUMAN_PLAYER
                self.whoseTurn.text = "Human’s Turn"
                print("TTT_ACTIVITY: ")
                displayBoard()
            }
        }
    
    @objc func img8Clicked(){
         // This code is for testing the GUI, will change in real game code
        
            if(turn == HUMAN_PLAYER){
            S8.image = #imageLiteral(resourceName: "x_img.png")
             board[0] = HUMAN_PLAYER
            turn = COMPUTER_PLAYER
                whoseTurn.text = "Computer’s Turn"
                print("TTT_ACTIVITY: ")
                displayBoard()
             }
            else{
            S8.image = #imageLiteral(resourceName: "o_img.png")
             board[0] = COMPUTER_PLAYER
            turn = HUMAN_PLAYER
                self.whoseTurn.text = "Human’s Turn"
                print("TTT_ACTIVITY: ")
                displayBoard()
            }
        }
    
    
    @objc func img9Clicked(){
         // This code is for testing the GUI, will change in real game code
        
            if(turn == HUMAN_PLAYER){
            S9.image = #imageLiteral(resourceName: "x_img.png")
             board[0] = HUMAN_PLAYER
            turn = COMPUTER_PLAYER
                whoseTurn.text = "Computer’s Turn"
                print("TTT_ACTIVITY: ")
                displayBoard()
             }
            else{
            S9.image = #imageLiteral(resourceName: "o_img.png")
             board[0] = COMPUTER_PLAYER
            turn = HUMAN_PLAYER
                self.whoseTurn.text = "Human’s Turn"
                print("TTT_ACTIVITY: ")
                displayBoard()
            }
        }
        
        func displayBoard()
        {
            print("I am in displayBoard")
            
        }
}

