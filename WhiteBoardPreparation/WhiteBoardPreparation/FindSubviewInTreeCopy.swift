//
//  FindSubviewInTreeCopy.swift
//  WhiteBoardPreparation
//
//  Created by Michael Kramskoy on 2/3/17.
//  Copyright © 2017 Connector. All rights reserved.
//

import Foundation

class View {
    var label: String
    var superview: View?
    var subviews = [View]()
    
    init(label: String) {
        self.label = label
    }
    
    func copy() -> View {
        let copy = View(label: self.label)
        for view in self.subviews {
            copy.subviews.append(view.copy())
        }
        return copy
    }
    
    func find(subview: View) -> View {
        var currentView: View = subview
        var superview: View? = subview.superview
        
        //getting coordintes in original tree
        var coordinates = [Int]()
        while superview != nil {
            let subviews: [View] = superview!.subviews
            let index: Int = subviews.index(of: currentView)!
            
            coordinates.append(index)
            currentView = superview!
            superview = currentView.superview
        }
        
        //finding the view in tree copy
        currentView = self
        while let coordinate = coordinates.popLast() {
            currentView = currentView.subviews[coordinate]
        }
        
        return currentView
    }
}

extension View: Equatable { }

func ==(lhs: View, rhs: View) -> Bool {
    return lhs === rhs
}

class FindSubviewInTreeCopy {
    class func run() {
        //building a tree
        let viewA1 = View(label:"A1")
        viewA1.subviews.append(View(label:"B1"))
        let viewB2 = View(label:"B2")
        viewA1.subviews.append(viewB2)
        viewA1.subviews.append(View(label:"B3"))
        
        let viewC2 = View(label:"C2")
        viewB2.subviews.append(View(label:"C1"))
        viewB2.subviews.append(viewC2)
        
        let viewD1 = View(label:"D1")
        viewC2.subviews.append(viewD1)
        viewC2.subviews.append(View(label:"D2"))
        
        //building a copy
        let viewA1Copy = viewA1.copy()
        let result = viewA1Copy.find(subview: viewD1)
        
        print("result = \(result.label)")
    }
}




