import Foundation

public class DoublyLinkedList<T> {
    public class Node {
        public weak var linkedList: DoublyLinkedList<T>?
        public var pre: Node? = nil
        public var next: Node? = nil
        public var value: T

        public init(_ value: T) {
            self.value = value
        }

        public var description: String {
            return "[\(value)]"
        }
    }

    public var head: Node? = nil
    public var tail: Node? = nil

    public init() {}

    public func append(_ node: Node) {
        if head == nil {
            head = node
        } else {
            tail?.next = node
            node.pre = tail
        }
        tail = node
        node.linkedList = self
    }

    public func remove(_ node: Node) {
        if node === head {
            head = node.next
        }
        if node === tail {
            tail = node.pre
        }
        node.pre?.next = node.next
        node.next?.pre = node.pre
        node.pre = nil
        node.next = nil
        node.linkedList = nil
    }

    public func dropHead() -> Node? {
        guard let head = head else {
            return nil
        }
        self.head = head.next
        head.pre = nil
        head.next = nil
        head.linkedList = nil
        self.head?.pre = nil
        self.tail = self.head == nil ? nil : self.tail
        return head
    }

    public func log() {
        var log = "nil"
        var curr = head
        while curr != nil  {
            log += " <=> \(curr?.description ?? "")"
            curr = curr?.next
        }
        log += " <=> nil"
        print(log)
    }
}

/*
 let linkedList = DoublyLinkedList<Int>()
 linkedList.append(DoublyLinkedList<Int>.Node(9))
 linkedList.log()
 linkedList.remove(linkedList.head!)
 linkedList.log()
 linkedList.append(DoublyLinkedList<Int>.Node(8))
 linkedList.log()
 linkedList.remove(linkedList.tail!)
 linkedList.log()
 linkedList.dropHead()
 linkedList.log()
 linkedList.dropHead()
 linkedList.log()
 linkedList.dropHead()
 linkedList.log()
 linkedList.append(DoublyLinkedList<Int>.Node(9))
 linkedList.log()
 linkedList.append(DoublyLinkedList<Int>.Node(8))
 linkedList.log()
 linkedList.append(DoublyLinkedList<Int>.Node(4))
 linkedList.log()
 linkedList.append(DoublyLinkedList<Int>.Node(5))
 linkedList.log()
 linkedList.append(DoublyLinkedList<Int>.Node(7))
 linkedList.log()
 linkedList.append(DoublyLinkedList<Int>.Node(2))
 linkedList.log()
 linkedList.append(DoublyLinkedList<Int>.Node(1))
 linkedList.log()
 linkedList.append(DoublyLinkedList<Int>.Node(3))
 linkedList.log()
 linkedList.append(DoublyLinkedList<Int>.Node(6))
 linkedList.log()
 linkedList.remove(linkedList.head!.next!.next!)
 linkedList.log()
 */
