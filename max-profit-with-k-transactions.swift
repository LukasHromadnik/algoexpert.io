class Program {
	private func computeProfit(_ prices: [Int], _ k : Int) -> [(Int, Int, Int)] {
		guard prices.count > 1 else { return [] }
		guard k > 0 else { return [] }
		var results: [(Int, Int, Int)] = [(-1, -1, Int.min)]
    for i in 0..<prices.count {
			for j in 0..<prices.count {
				let endIndex = prices.count - j - 1
				guard i < endIndex else { continue }
				let profit = prices[endIndex] - prices[i]
				let childProfit = computeProfit(
					Array(prices.dropFirst(endIndex + 1)),
					k - 1
				)
				let finalProfit = profit + childProfit.map { $0.2 }.reduce(0, +)
				let currentProfix = results.map { $0.2 }.reduce(0, +)
				if finalProfit > currentProfix {
					results = [(i, endIndex, profit)] + childProfit
				}
			}
		}
		return results
	}

	func maxProfitWithKTransactions(_ prices: [Int], _ k: Int) -> Int {
		let result = computeProfit(prices, k)
		return max(result.map { $0.2 }.reduce(0, +), 0)
  }
}
