class Program {
  class LinkedList {
    var value: Int
    var next: LinkedList?

    init(value: Int) {
      self.value = value
      next = nil
    }
  }

  static func shiftLinkedList(_ head: LinkedList, _ k: Int) -> LinkedList? {
		guard k != 0 else { return head }
		var end: LinkedList! = head
		var count = 1
		while end.next != nil {
			end = end.next
			count += 1
		}
		
		let offset = k > 0 ? count - (k % count) : abs(k) % count
		guard offset != 0 else { return head }
		
		end.next = head
		
		var current: LinkedList! = head
		for _ in 0..<offset - 1 {
			current = current.next
		}
		
		let newHead = current.next
		current.next = nil
		
		return newHead
	}
}
