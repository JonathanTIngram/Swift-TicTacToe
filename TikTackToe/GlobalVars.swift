//
//  GlobalVars.swift
//  TikTackToe
//
//  Created by Jonathan Ingram on 10/27/21.
//


class GlobalVars {
    
// These are the properties you can store in your singleton
    var computerWins: Int = 0;
    var humanWins: Int = 0;
    var tieCount: Int = 0;
    
    
// Here is how you would get to it without there being a global collision of //variables, or in other words, it is a globally accessable parameter that is //specific to the class.

    class var sharedManager: GlobalVars {
        struct Static {
            static let instance = GlobalVars()
        }
        return Static.instance
    }
}
