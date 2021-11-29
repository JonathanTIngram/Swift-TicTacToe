//
//  ScoreViewController.swift
//  TikTackToe
//
//  Created by Jonathan Ingram on 10/27/21.
//

import UIKit

class ScoreViewController: UIViewController {
    
    @IBOutlet weak var computerScoreLabel: UILabel!
    @IBOutlet weak var humanScoreLabel: UILabel!
    @IBOutlet weak var tieLabel: UILabel!
    
    var humanWins = GlobalVars.sharedManager.computerWins;
    var computerWins = GlobalVars.sharedManager.humanWins;
    var tieCount = GlobalVars.sharedManager.tieCount;
    
    @IBAction func resetButton(_ sender: Any) {
        GlobalVars.sharedManager.humanWins = 0;
        GlobalVars.sharedManager.computerWins = 0;
        GlobalVars.sharedManager.tieCount = 0;
        
        computerScoreLabel.text = String(GlobalVars.sharedManager.computerWins)
        humanScoreLabel.text = String(GlobalVars.sharedManager.humanWins)
        tieLabel.text = String(GlobalVars.sharedManager.tieCount)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        computerScoreLabel.text = String(GlobalVars.sharedManager.computerWins)
        humanScoreLabel.text = String(GlobalVars.sharedManager.humanWins)
        tieLabel.text = String(GlobalVars.sharedManager.tieCount)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        computerScoreLabel.text = String(GlobalVars.sharedManager.computerWins)
        humanScoreLabel.text = String(GlobalVars.sharedManager.humanWins)
        tieLabel.text = String(GlobalVars.sharedManager.tieCount)
        
    }


}
