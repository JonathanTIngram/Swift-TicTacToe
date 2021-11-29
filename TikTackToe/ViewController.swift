//
//  ViewController.swift
//  TikTackToe
//
//  Created by Jonathan Ingram on 9/22/21.
//

import UIKit
import AVFoundation

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
    
    
    
    //Sound Variables
    var Xsound: AVAudioPlayer?
    var Ysound: AVAudioPlayer?
    
    
    var mBoardArray: [UIImageView] = [];

    
    
    let HUMAN_PLAYER = "X"
    let COMPUTER_PLAYER = "O"
    var board: [String] = ["0","1","2","3","4","5","6","7","8"]
    let BOARD_SIZE = 9
    var turn = "X"
    var win = 0
    var move = -1
    
    var currentImage: UIImageView!
    var boardNum: Int!
    
    /****************************** * GAME DIFICULTY VAR * ** ******************************/
    var gameDifficulty: Int!
    
    var level: String!

    
    
    
    
    
    @IBAction func GameSettings(_ sender: Any) {
        
        let easy = "Easy"
        let medium = "Medium"
        let hard = "Hard"
        
        let ac = UIAlertController(title: "Game Settings", message: "Select a Difficulty", preferredStyle: .actionSheet)
        
        let easyAction = UIAlertAction(title: easy, style: .default, handler: { action in
        self.setDifficulty(difficulty: 1) })
        
        ac.addAction(easyAction)
        
        let mediumAction = UIAlertAction(title: medium, style: .default, handler: { action in
        self.setDifficulty(difficulty: 2) })
        
        ac.addAction(mediumAction)
        
        let hardAction = UIAlertAction(title: hard, style: .default, handler: { action in
        self.setDifficulty(difficulty: 3) })
        
        ac.addAction(hardAction)
        
        present(ac, animated: true, completion: nil)
    }
    
    
    @IBAction func NewGame(_ sender: Any) {
        S1.image = nil
        S2.image = nil
        S3.image = nil
        S4.image = nil
        S5.image = nil
        S6.image = nil
        S7.image = nil
        S8.image = nil
        S9.image = nil
        
        board = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
        
        whoseTurn.text = "Player X's Turn"
        
        win = 0
        turn = HUMAN_PLAYER
    }
    
    
    
    /****************************** * GAME DIFICULTY HANDLER * ** *****************************/
    func setDifficulty(difficulty: Int){
        
        
        gameDifficulty = difficulty
        
        switch difficulty{
            
        case 1:
            level = "Easy"
            
        case 2:
            level = "Medium"
            
        case 3:
            level = "Expert"
            
        default:
            level = "Easy"
        }
        
        
        print("TTT_ACTIVITY: Game Difficulty Level Now Set To: " + level);
    }
    
    
    
    

    override func viewDidLoad() {
       super.viewDidLoad()
        
        
        mBoardArray.append(S1)
        mBoardArray.append(S2)
        mBoardArray.append(S3)
        mBoardArray.append(S4)
        mBoardArray.append(S5)
        mBoardArray.append(S6)
        mBoardArray.append(S7)
        mBoardArray.append(S8)
        mBoardArray.append(S9)
        
        gameDifficulty = 1

       
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
    
    func playX() {
        let path = Bundle.main.path(forResource: "sword.mp3", ofType:nil)!
        let url = URL(fileURLWithPath: path)
        do {
        
            Xsound = try AVAudioPlayer(contentsOf: url)
            Xsound?.play()
        } catch {
        // couldn't load file :(
            print("Can't load the file")
        }
    }
    
    func playY() {
        let path = Bundle.main.path(forResource: "swish.mp3", ofType:nil)!
        let url = URL(fileURLWithPath: path)
        do {
        
            Ysound = try AVAudioPlayer(contentsOf: url)
            Ysound?.play()
        } catch {
        // couldn't load file :(
            print("Can't load the file")
        }
    }
    
    


    @objc func img1Clicked(){
         // This code is for testing the GUI, will change in real game code
        
        if(win == 0){
            
            if(turn == HUMAN_PLAYER && S1.image == nil){
                playX();
                mBoardArray[0].image = #imageLiteral(resourceName: "x_img.png")
                turn = COMPUTER_PLAYER
                whoseTurn.text = "Computer's Turn"
                board[0] = HUMAN_PLAYER
                displayBoard()
                checkForWinner()
                showWinStatus()
                if(win == 0){
                    let when = DispatchTime.now() + 1;
                    DispatchQueue.main.asyncAfter(deadline: when){
                        self.playY();
                        self.getComputerMove()
                        self.turn = self.HUMAN_PLAYER
                        self.whoseTurn.text = "Human's Turn"
                        self.displayBoard()
                        self.checkForWinner()
                        self.showWinStatus()
                    }
                }
            }
        }
    }
    
    
    @objc func img2Clicked(){
         // This code is for testing the GUI, will change in real game code
        
        if(win == 0){
            
            if(turn == HUMAN_PLAYER  && S2.image == nil){
                playX();
                mBoardArray[1].image = #imageLiteral(resourceName: "x_img.png")
                turn = COMPUTER_PLAYER
                whoseTurn.text = "Computer's Turn"
                board[1] = HUMAN_PLAYER
                displayBoard()
                checkForWinner()
                showWinStatus()
                if(win == 0){
                    let when = DispatchTime.now() + 1;
                    DispatchQueue.main.asyncAfter(deadline: when){
                        self.playY();
                        self.getComputerMove()
                        self.turn = self.HUMAN_PLAYER
                        self.whoseTurn.text = "Human's Turn"
                        self.displayBoard()
                        self.checkForWinner()
                        self.showWinStatus()
                    }
            }
                }
            }
        }
    
    @objc func img3Clicked(){
         // This code is for testing the GUI, will change in real game code
        
        if(win == 0){
            
            if(turn == HUMAN_PLAYER  && S3.image == nil){
                playX()
                mBoardArray[2].image = #imageLiteral(resourceName: "x_img.png")
                turn = COMPUTER_PLAYER
                whoseTurn.text = "Computer's Turn"
                board[2] = HUMAN_PLAYER
                displayBoard()
                checkForWinner()
                showWinStatus()
                if(win == 0){
                    let when = DispatchTime.now() + 1;
                    DispatchQueue.main.asyncAfter(deadline: when){
                        self.playY();
                        self.getComputerMove()
                        self.turn = self.HUMAN_PLAYER
                        self.whoseTurn.text = "Human's Turn"
                        self.displayBoard()
                        self.checkForWinner()
                        self.showWinStatus()
                    }
            }
                }
            }
        }
    
    @objc func img4Clicked(){
         // This code is for testing the GUI, will change in real game code
        
        if(win == 0){
            
            if(turn == HUMAN_PLAYER  && S4.image == nil){
                playX();
                mBoardArray[3].image = #imageLiteral(resourceName: "x_img.png")
                turn = COMPUTER_PLAYER
                whoseTurn.text = "Computer's Turn"
                board[3] = HUMAN_PLAYER
                displayBoard()
                checkForWinner()
                showWinStatus()
                if(win == 0){
                    let when = DispatchTime.now() + 1;
                    DispatchQueue.main.asyncAfter(deadline: when){
                        self.playY();
                        self.getComputerMove()
                        self.turn = self.HUMAN_PLAYER
                        self.whoseTurn.text = "Human's Turn"
                        self.displayBoard()
                        self.checkForWinner()
                        self.showWinStatus()
                    }
            }
                }
            }
        }
    
    @objc func img5Clicked(){
         // This code is for testing the GUI, will change in real game code
        
        if(win == 0){
            
            if(turn == HUMAN_PLAYER  && S5.image == nil){
                playX()
                mBoardArray[4].image = #imageLiteral(resourceName: "x_img.png")
                turn = COMPUTER_PLAYER
                whoseTurn.text = "Computer's Turn"
                board[4] = HUMAN_PLAYER
                displayBoard()
                checkForWinner()
                showWinStatus()
                if(win == 0){
                    let when = DispatchTime.now() + 1;
                    DispatchQueue.main.asyncAfter(deadline: when){
                        self.playY()
                        self.getComputerMove()
                        self.turn = self.HUMAN_PLAYER
                        self.whoseTurn.text = "Human's Turn"
                        self.displayBoard()
                        self.checkForWinner()
                        self.showWinStatus()
                    }
            }
                }
            }
        }
    
    @objc func img6Clicked(){
         // This code is for testing the GUI, will change in real game code
        
        if(win == 0){
            
            if(turn == HUMAN_PLAYER  && S6.image == nil){
                playX();
                mBoardArray[5].image = #imageLiteral(resourceName: "x_img.png")
                turn = COMPUTER_PLAYER
                whoseTurn.text = "Computer's Turn"
                board[5] = HUMAN_PLAYER
                displayBoard()
                checkForWinner()
                showWinStatus()
                if(win == 0){
                    let when = DispatchTime.now() + 1;
                    DispatchQueue.main.asyncAfter(deadline: when){
                        self.playY()
                        self.getComputerMove()
                        self.turn = self.HUMAN_PLAYER
                        self.whoseTurn.text = "Human's Turn"
                        self.displayBoard()
                        self.checkForWinner()
                        self.showWinStatus()
                    }
            }
                }
            }
        }
    
    @objc func img7Clicked(){
         // This code is for testing the GUI, will change in real game code
        
        if(win == 0){
            
            if(turn == HUMAN_PLAYER  && S7.image == nil){
                playX();
                mBoardArray[6].image = #imageLiteral(resourceName: "x_img.png")
                turn = COMPUTER_PLAYER
                whoseTurn.text = "Computer's Turn"
                board[6] = HUMAN_PLAYER
                displayBoard()
                checkForWinner()
                showWinStatus()
                if(win == 0){
                    let when = DispatchTime.now() + 1;
                    DispatchQueue.main.asyncAfter(deadline: when){
                        self.playY();
                        self.getComputerMove()
                        self.turn = self.HUMAN_PLAYER
                        self.whoseTurn.text = "Human's Turn"
                        self.displayBoard()
                        self.checkForWinner()
                        self.showWinStatus()
                    }
            }
                }
            }
        }
    
    @objc func img8Clicked(){
         // This code is for testing the GUI, will change in real game code
        
        if(win == 0){
            
            if(turn == HUMAN_PLAYER  && S8.image == nil){
                playX();
                mBoardArray[7].image = #imageLiteral(resourceName: "x_img.png")
                turn = COMPUTER_PLAYER
                whoseTurn.text = "Computer's Turn"
                board[7] = HUMAN_PLAYER
                displayBoard()
                checkForWinner()
                showWinStatus()
                if(win == 0){
                    let when = DispatchTime.now() + 1;
                    DispatchQueue.main.asyncAfter(deadline: when){
                        self.playY();
                        self.getComputerMove()
                        self.turn = self.HUMAN_PLAYER
                        self.whoseTurn.text = "Human's Turn"
                        self.displayBoard()
                        self.checkForWinner()
                        self.showWinStatus()
                    }
            }
                }
            }
        }
    
    
    @objc func img9Clicked(){
         // This code is for testing the GUI, will change in real game code
        
        if(win == 0){
            
            if(turn == HUMAN_PLAYER  && S9.image == nil){
                playX();
                mBoardArray[8].image = #imageLiteral(resourceName: "x_img.png")
                turn = COMPUTER_PLAYER
                whoseTurn.text = "Computer's Turn"
                board[8] = HUMAN_PLAYER
                displayBoard()
                checkForWinner()
                showWinStatus()
                if(win == 0){
                    let when = DispatchTime.now() + 1;
                    DispatchQueue.main.asyncAfter(deadline: when){
                        self.playY();
                        self.getComputerMove()
                        self.turn = self.HUMAN_PLAYER
                        self.whoseTurn.text = "Human's Turn"
                        self.displayBoard()
                        self.checkForWinner()
                        self.showWinStatus()
                    }
            }
                }
            }
        }
        
        func displayBoard()    {
                print(board[0] + " | " + board[1] + " | " + board[2]);
                print("-----------");
                print(board[3] + " | " + board[4] + " | " + board[5]);
                print("-----------");
                print(board[6] + " | " + board[7] + " | " + board[8]);
            }
        
        // Check for a winner.  Return
        //  0 if no winner or tie yet
        //  1 if it's a tie
        //  2 if X won
        //  3 if O won
    func checkForWinner()
    {
        
        // Check horizontal wins
        for i in stride(from: 0, to: 8, by: 3)
        {
            //print(i)
            if (board[i] == HUMAN_PLAYER && board[i+1] == HUMAN_PLAYER && board[i+2] == HUMAN_PLAYER)
            {
                win = 2
                return
            }
            
            if (board[i] == COMPUTER_PLAYER && board[i+1] == COMPUTER_PLAYER && board[i+2] == COMPUTER_PLAYER)
            {
                win = 3
                return
            }
        }
        
        // Check vertical wins
        for i in 0 ... 2
        {
            if (board[i] == HUMAN_PLAYER && board[i+3] == HUMAN_PLAYER && board[i+6] == HUMAN_PLAYER)
            {
                win = 2
                return
            }
            
            if (board[i] == COMPUTER_PLAYER && board[i+3] == COMPUTER_PLAYER && board[i+6] == COMPUTER_PLAYER)
            {
                win =  3
                return
            }
        }
        
        // Check for diagonal wins
        if ((board[0] == HUMAN_PLAYER && board[4] == HUMAN_PLAYER && board[8] == HUMAN_PLAYER) || (board[2] == HUMAN_PLAYER && board[4] == HUMAN_PLAYER && board[6] == HUMAN_PLAYER))
        {
            win = 2
            return
        }
        
        if ((board[0] == COMPUTER_PLAYER && board[4] == COMPUTER_PLAYER && board[8] == COMPUTER_PLAYER) || (board[2] == COMPUTER_PLAYER && board[4] == COMPUTER_PLAYER && board[6] == COMPUTER_PLAYER))
        {
            win = 3
            return
        }
        
        // Check for tie
        for i in 0...BOARD_SIZE-1
        {
            // If we find a number, then no one has won yet
            if (board[i] != HUMAN_PLAYER && board[i] != COMPUTER_PLAYER)
            {
                win = 0
                return
            }
        }
        
        // If we make it through the previous loop, all places are taken, so it's a tie
        win = 1
        
        //update tie count

    }
    
        func showWinStatus(){
            
            print("win = " + String(win))
            if(win == 3){
                print("Computer Wins!!")
                whoseTurn.text = "Computer Wins !!!"
                GlobalVars.sharedManager.computerWins += 1;
            }
            
            if(win == 2){
                print("Human Wins!!")
                whoseTurn.text = "Human Wins !!!"
                GlobalVars.sharedManager.humanWins += 1;
            }
            
            
            if(win == 1){
                print("It a Tie!!")
                whoseTurn.text = "It's a Tie !!!"
                GlobalVars.sharedManager.tieCount += 1;
            }
            
            return 
            
            
            
        }
    
    
    func getRandomMove()
    {
            var count = 0
            // Generate random move
            repeat
            {
                count += 1
                move  = Int(arc4random_uniform(9))
                print("random move is " + String(move))
            } while ((board[move] == HUMAN_PLAYER || board[move] == COMPUTER_PLAYER) && count <= 9)

            if(board[move] == HUMAN_PLAYER || board[move] == COMPUTER_PLAYER){
                return
            }
            else{

                print("Computer is making a random moving to " + String((move)))

                board[move] = COMPUTER_PLAYER
                mBoardArray[move].image = #imageLiteral(resourceName: "o_img.png")


                return
            }
    }
    
    func getWinningMove()
    {
        // First see if there's a move O can make to win
        for i in 0 ... BOARD_SIZE-1 {
            if (board[i] != HUMAN_PLAYER && board[i] != COMPUTER_PLAYER) {
                let curr = board[i]
                board[i] = COMPUTER_PLAYER

                checkForWinner()

                if (win == 3) {
                    print("Computer is making a winning moving to " + String((i)))
                    mBoardArray[i].image = #imageLiteral(resourceName: "o_img.png")

                    return


                }
                else
                {

                    board[i] = curr;
                }

            }
        }

        var count = 0
        // Generate random move
        repeat
        {
            count += 1
            move  = Int(arc4random_uniform(9))
            print("random move is " + String(move))
        } while ((board[move] == HUMAN_PLAYER || board[move] == COMPUTER_PLAYER) && count <= 9)

        if(board[move] == HUMAN_PLAYER || board[move] == COMPUTER_PLAYER){
            return
        }
        else{

            print("Computer is making a random moving to " + String((move)))

            board[move] = COMPUTER_PLAYER
            mBoardArray[move].image = #imageLiteral(resourceName: "o_img.png")


            return
        }
    }
    
    func getBlockingMove()
    {
            // First see if there's a move O can make to win
            for i in 0 ... BOARD_SIZE-1 {
                if (board[i] != HUMAN_PLAYER && board[i] != COMPUTER_PLAYER) {
                    let curr = board[i]
                    board[i] = COMPUTER_PLAYER

                    checkForWinner()

                    if (win == 3) {
                        print("Computer is making a winning moving to " + String((i)))
                        mBoardArray[i].image = #imageLiteral(resourceName: "o_img.png")

                        return


                    }
                    else
                    {

                        board[i] = curr;
                    }

                }
            }


            // See if there's a move O can make to block X from winning
            for i in 0 ... BOARD_SIZE-1 {
                if (board[i] != HUMAN_PLAYER && board[i] != COMPUTER_PLAYER) {
                    let curr = board[i];   // Save the current number
                    board[i] = HUMAN_PLAYER


                    checkForWinner()
                    if (win == 2) {
                        print("Computer is making a blocking moving to " + String((i)))
                        board[i] = self.COMPUTER_PLAYER;
                        mBoardArray[i].image = #imageLiteral(resourceName: "o_img.png")

                        return
                    }


                    else{

                        board[i] = curr}
                }
            }


            var count = 0
            // Generate random move
            repeat
            {
                count += 1
                move  = Int(arc4random_uniform(9))
                print("random move is " + String(move))
            } while ((board[move] == HUMAN_PLAYER || board[move] == COMPUTER_PLAYER) && count <= 9)

            if(board[move] == HUMAN_PLAYER || board[move] == COMPUTER_PLAYER){
                return
            }
            else{

                print("Computer is making a random moving to " + String((move)))

                board[move] = COMPUTER_PLAYER
                mBoardArray[move].image = #imageLiteral(resourceName: "o_img.png")


                return
            }
 
    }
    
    func getComputerMove()
    {
        
        switch level{
            
        case "Easy":
            getRandomMove();
            
        case "Medium":
            getWinningMove()
            
        case "Expert":
            getBlockingMove()
            
        default:
            getRandomMove()
        }
        
        return
    }
        
//    func getComputerMove()
//    {
//
//
//
//            // First see if there's a move O can make to win
//            for i in 0 ... BOARD_SIZE-1 {
//                if (board[i] != HUMAN_PLAYER && board[i] != COMPUTER_PLAYER) {
//                    let curr = board[i]
//                    board[i] = COMPUTER_PLAYER
//
//                    checkForWinner()
//
//                    if (win == 3) {
//                        print("Computer is making a winning moving to " + String((i)))
//                        mBoardArray[i].image = #imageLiteral(resourceName: "o_img.png")
//
//                        return
//
//
//                    }
//                    else
//                    {
//
//                        board[i] = curr;
//                    }
//
//                }
//            }
//
//
//            // See if there's a move O can make to block X from winning
//            for i in 0 ... BOARD_SIZE-1 {
//                if (board[i] != HUMAN_PLAYER && board[i] != COMPUTER_PLAYER) {
//                    let curr = board[i];   // Save the current number
//                    board[i] = HUMAN_PLAYER
//
//
//                    checkForWinner()
//                    if (win == 2) {
//                        print("Computer is making a blocking moving to " + String((i)))
//                        board[i] = self.COMPUTER_PLAYER;
//                        mBoardArray[i].image = #imageLiteral(resourceName: "o_img.png")
//
//                        return
//                    }
//
//
//                    else{
//
//                        board[i] = curr}
//                }
//            }
//
//
//            var count = 0
//            // Generate random move
//            repeat
//            {
//                count += 1
//                move  = Int(arc4random_uniform(9))
//                print("random move is " + String(move))
//            } while ((board[move] == HUMAN_PLAYER || board[move] == COMPUTER_PLAYER) && count <= 9)
//
//            if(board[move] == HUMAN_PLAYER || board[move] == COMPUTER_PLAYER){
//                return
//            }
//            else{
//
//                print("Computer is making a random moving to " + String((move)))
//
//                board[move] = COMPUTER_PLAYER
//                mBoardArray[move].image = #imageLiteral(resourceName: "o_img.png")
//
//
//                return
//            }
//    }

}

