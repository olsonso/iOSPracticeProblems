//
//  main.swift
//  iOSPracticeProblems
//
//  Created by Sonja Olson on 12/1/18.
//  Copyright © 2018 Sonja Olson. All rights reserved.
//

import Foundation
import Cocoa
 // Binary Search Tree Implementation

class Node<T> {
    var value: T
    var leftChild: Node?
    var rightChild: Node?
    
    init(value: T,
         leftNode: Node? = nil,
         rightNode: Node? = nil) {
        self.value = value
    }
}

class BinaryTree<T: Comparable & CustomStringConvertible> {
    
    private var rootNode: Node<T>?
    
    func insert(element: T) {
        let node = Node(value: element)
        if let rootNode = self.rootNode {
            self.insert(rootNode, node)
        } else {
            self.rootNode = node
        }
    }
    
    // Recurisve Add
    private func insert(_ rootNode: Node<T>, _ node: Node<T>) {
        if rootNode.value > node.value {
            if let leftNode = rootNode.leftChild {
                self.insert(leftNode, node)
            } else {
                rootNode.leftChild = node
            }
        } else {
            if let rightNode = rootNode.rightChild {
                self.insert(rightNode, node)
            } else {
                rootNode.rightChild = node
            }
        }
    }
}

extension BinaryTree {
    
    func traverse() {
        print("\nPRE-ORDER TRAVERSE")
        self.preorder(self.rootNode)
        print("\n\nIN-ORDER TRAVERSE")
        self.inorder(self.rootNode)
        print("\n\nPOST-ORDER TRAVERSE")
        self.postorder(self.rootNode)
        print("\n")
    }
    
    // LNR : LEFT NODE RIGHT
    private func inorder(_ node: Node<T>?) {
        guard let _ = node else { return }
        self.inorder(node?.leftChild)
        print("\(node!.value)", terminator: " ")
        self.inorder(node?.rightChild)
    }
    
    // NLR : NODE LEFT RIGHT
    private func preorder(_ node: Node<T>?) {
        guard let _ = node else { return }
        print("\(node!.value)", terminator: " ")
        self.preorder(node?.leftChild)
        self.preorder(node?.rightChild)
    }
    
    // LRN :  LEFT RIGHT NODE
    private func postorder(_ node: Node<T>?) {
        guard let _ = node else { return }
        self.postorder(node?.leftChild)
        self.postorder(node?.rightChild)
        print("\(node!.value)", terminator: " ")
    }
}
