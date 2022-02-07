import UIKit

var inputArray = [10, 1, 4, 2, 8]

func bubbleSort(array: [Int], withElements count: Int) -> [Int] {

    var inputArray = array
    for i in 0...(count - 1) {

        for j in 0..<(count - i - 1) {
            if inputArray[j] > inputArray[j + 1] {
                let temp = inputArray[j + 1]
                inputArray[j + 1] = inputArray[j]
                inputArray[j] = temp
            }
            print(inputArray)
        }

        print("\n\n")
    }

    return inputArray
}

print(bubbleSort(array: inputArray, withElements: inputArray.count))


func bubbleSort<Element>(array: inout [Element]) -> [Element] where Element : Comparable {

    let loopCounter = (array.count - 1)
    for index in 0...loopCounter {

        for j in 0..<(loopCounter - index) {
            if array[j] > array[j + 1] {
                //swap
                let temp = array[j]
                array[j] = array[j + 1]
                array[j + 1] = temp
            }
        }
    }

    return array
}

print(bubbleSort(array: &inputArray))





































