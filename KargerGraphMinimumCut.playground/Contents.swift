//: Playground - noun: a place where people can play

import UIKit

extension Array where Element : Equatable {
    
    mutating func removeObject(_ object : Iterator.Element) {
        while let index = self.index(of: object) {
            self.remove(at: index)
        }
    }
}

struct Graph<T: Hashable> {
    
    let directed: Bool
    var adj = Dictionary<T, [T]>()
    
    init(directed d: Bool) {
        directed = d
    }
    
    mutating func addVertex(_ v: T) {
        self[v] = [T]()
    }
    
    mutating func addEdge(from v: T, to u: T) {
        if self[v] == nil {
            addVertex(v)
        }
        
        if self[u] == nil {
            addVertex(u)
        }
        
        self[v]?.append(u)
        
        //        if !directed {
        //            self[u]?.append(v)
        //        }
    }
    
    subscript(key: T) -> [T]? {
        get {
            return adj[key]
        }
        set(newValue) {
            return adj[key] = newValue
        }
    }
}

func randomContraction( _ graph: inout Graph<Int>) {
    
    let keys = [Int](graph.adj.keys)
    
    let firstRandomKey = Int(arc4random_uniform(UInt32(keys.count)))
    let firstVertex = keys[firstRandomKey]
    
    let secondRandomKey = Int(arc4random_uniform(UInt32(graph[firstVertex]!.count)))
    let secondVertex = graph[firstVertex]![secondRandomKey]
    
    print("firstVertex = \(firstVertex)")
    print("secondVertex = \(secondVertex)")
    
    for secondVertexEdgeEnd in graph[secondVertex]! {
        
        //removing references of second (contracted vertex) in other edges
        //now all references will point to first vertex
        if secondVertexEdgeEnd != firstVertex {
            var vertexEdges = graph[secondVertexEdgeEnd]
            vertexEdges?.removeObject(secondVertex)
            vertexEdges?.append(firstVertex)
            graph[secondVertexEdgeEnd] = vertexEdges
        }
        
        //contracting second vertex into first
        graph[firstVertex]?.append(secondVertexEdgeEnd)
    }
    
    graph[firstVertex]?.removeObject(secondVertex)
    graph[firstVertex]?.removeObject(firstVertex)
    
    //removing second (contracted vertex)
    graph.adj[secondVertex] = nil
    
    print("count = \(graph.adj.count)")
}


var verticesArray = [String]()
//do {
//    let url: NSURL! = NSBundle.mainBundle().URLForResource("kargerMinCut", withExtension: "txt")
//    let string = try String(contentsOfURL: url, encoding: NSUTF8StringEncoding)
//    verticesArray = string.componentsSeparatedByString("\r\n")
//    verticesArray.removeLast()
//}
//catch {
//    print("")
//}

        verticesArray = ["1\t2\t3\t4\t7",//
                         "2\t1\t3\t4",
                         "3\t1\t2\t4",//
                         "4\t1\t2\t3\t5",
                         "5\t4\t6\t7\t8",
                         "6\t5\t7\t8",
                         "7\t1\t5\t6\t8",
                         "8\t5\t6\t7"]

var minCutNumber = Int.max
for _ in 0...100 {
    var graph = Graph<Int>(directed: false)
    
    for edgesString in verticesArray {
        var edgesArray = edgesString.components(separatedBy: "\t")
        //edgesArray.removeLast()
        var integers = edgesArray.map { Int($0)! }
        let from = integers.removeFirst()
        for to in integers {
            graph.addEdge(from: from, to: to)
        }
    }
    
    while graph.adj.count != 2 {
        randomContraction(&graph)
    }
    
    let key = Array(graph.adj.keys).first!
    let edgesCount = graph[key]!.count
    if minCutNumber > edgesCount {
        minCutNumber = edgesCount
    }
}

print("minCutNumber = \(minCutNumber)")
