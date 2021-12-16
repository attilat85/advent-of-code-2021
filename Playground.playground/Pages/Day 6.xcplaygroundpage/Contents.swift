
// PART 1

let testInput: [Int] = [3,4,3,1,2]
let input: [Int] = [4,1,4,1,3,3,1,4,3,3,2,1,1,3,5,1,3,5,2,5,1,5,5,1,3,2,5,3,1,3,4,2,3,2,3,3,2,1,5,4,1,1,1,2,1,4,4,4,2,1,2,1,5,1,5,1,2,1,4,4,5,3,3,4,1,4,4,2,1,4,4,3,5,2,5,4,1,5,1,1,1,4,5,3,4,3,4,2,2,2,2,4,5,3,5,2,4,2,3,4,1,4,4,1,4,5,3,4,2,2,2,4,3,3,3,3,4,2,1,2,5,5,3,2,3,5,5,5,4,4,5,5,4,3,4,1,5,1,3,4,4,1,3,1,3,1,1,2,4,5,3,1,2,4,3,3,5,4,4,5,4,1,3,1,1,4,4,4,4,3,4,3,1,4,5,1,2,4,3,5,1,1,2,1,1,5,4,2,1,5,4,5,2,4,4,1,5,2,2,5,3,3,2,3,1,5,5,5,4,3,1,1,5,1,4,5,2,1,3,1,2,4,4,1,1,2,5,3,1,5,2,4,5,1,2,3,1,2,2,1,2,2,1,4,1,3,4,2,1,1,5,4,1,5,4,4,3,1,3,3,1,1,3,3,4,2,3,4,2,3,1,4,1,5,3,1,1,5,3,2,3,5,1,3,1,1,3,5,1,5,1,1,3,1,1,1,1,3,3,1]


private func computeFishesSpawned(from startValue: Int, day: Int, memo: inout [Int: Int]) -> Int {
    if let count = memo[startValue] {
        return count
    }

    let zeroDaysOfThisFish = (0...).lazy
        .map({ (7 * $0) + startValue })
        .prefix(while: { $0 < day })

    var count = 0
    for zeroDay in zeroDaysOfThisFish {
        count += 1 + computeFishesSpawned(from: zeroDay + 9, day: day, memo: &memo)
    }
    memo[startValue] = count

    return count
}

public func calculate(input: [Int], day: Int) -> Int {
    var memo = [Int: Int]()

    let newFishesCount = input
        .map({ computeFishesSpawned(from: $0, day: day, memo: &memo) })
        .reduce(0, +)

    return newFishesCount + input.count
}

print("Test for \(80) days: ", calculate(input: testInput, day: 80))
print("Output for \(80) days: ", calculate(input: input, day: 80))

// PART 2

print("Test for \(256) days: ", calculate(input: testInput, day: 256))
print("Output for \(256) days: ", calculate(input: input, day: 256))

//: [Next](@next)
