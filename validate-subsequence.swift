class Program {
  static func isValidSubsequence(_ array: [Int], _ sequence: [Int]) -> Bool {
		var j = 0
		for i in 0..<array.count {
			j = array[i] == sequence[j] ? j + 1 : j
			if j == sequence.count { return true }
		}
    return false
  }
}
