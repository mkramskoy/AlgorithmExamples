//
//  Trie.swift
//  WhiteBoardPreparation
//
//  Created by Michael Kramskoy on 2/1/17.
//  Copyright © 2017 Connector. All rights reserved.
//

import Foundation

class Trie {
    private var root = Node()
    
    class Node {
        let character: Character?
        var children = [Character:Node]()
        var isCompleteWord = false
        
        init(character: Character? = nil) {
            self.character = character
        }
    }
    
    func add(word: String) {
        var currentNode = root
        for index in word.characters.indices {
            let character = word[index]
            
            if currentNode.children[character] == nil {
                let newNode = Node(character: character)
                currentNode.children[character] = newNode
            }
            
            currentNode = currentNode.children[character]!
            if index == word.index(before: word.endIndex) {
                currentNode.isCompleteWord = true
            }
        }
    }
    
    func searchFor(string: String) -> Int {
        var currentNode = root
        
        for index in string.characters.indices {
            let character = string[index]
            
            if let nextNode = currentNode.children[character] {
                currentNode = nextNode
            }
            else {
                return 0
            }
        }
        
        let matchesCount = countMatchesFrom(node: currentNode)
        
        return matchesCount
    }
    
    private func countMatchesFrom(node: Node) -> Int {
        var counter = 0

        let queue = Queue<Node>()
        queue.push(node)
        
        while let current = queue.pop() {
            if current.isCompleteWord {
                counter += 1
            }
            
            for (_, child) in current.children {
                queue.push(child)
            }
        }
        
        return counter
    }
}
