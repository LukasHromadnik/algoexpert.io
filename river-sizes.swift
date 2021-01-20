class Program {
	func search(_ i: Int, _ j: Int, _ matrix: [[Int]], _ flag: Int, _ result: inout [[Int]]) -> Int {
		guard matrix[i][j] == 1 && result[i][j] != flag else { return 0 }
		
		result[i][j] = flag
		
		return [
			search(min(i + 1, matrix.count - 1), j, matrix, flag, &result),
			search(max(i - 1, 0), j, matrix, flag, &result),
			search(i, min(j + 1, matrix[i].count - 1), matrix, flag, &result),
			search(i, max(j - 1, 0), matrix, flag, &result)
		].reduce(1, +)
	}
  
	func riverSizes(_ matrix: [[Int]]) -> [Int] {
		var result = matrix.map { $0.map { _ in 0 } }
		
		var flag = 1
		var counts: [Int] = []
		for i in 0..<matrix.count {
			for j in 0..<matrix[i].count {
				guard matrix[i][j] == 1 && result[i][j] == 0 else { continue }
				counts.append(search(i, j, matrix, flag, &result))
				flag += 1
			}
		}
		
		return counts
  }
}
