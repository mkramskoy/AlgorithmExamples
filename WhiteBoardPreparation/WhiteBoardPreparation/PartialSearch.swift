//
//  PartialSearch.swift
//  WhiteBoardPreparation
//
//  Created by Michael Kramskoy on 2/1/17.
//  Copyright © 2017 Connector. All rights reserved.
//

import Foundation

class PartialSearch {
    class func run() {
        let vocab = Trie()
        vocab.add(word: "pew")
        vocab.add(word: "pewpew")
        vocab.add(word: "pewpe")
        vocab.add(word: "pewpews")
        vocab.add(word: "pewp")
        
        let _ = vocab.searchFor(string: "pe")
    }
}
