
func mergeSort<Element>(array: [Element]) -> [Element] where Element: Comparable {

    //Divide array recursivly till subarray has only one element left
    guard array.count > 1 else { return array }

    let midIndex = array.count / 2
    let left = mergeSort(array: Array(array[..<midIndex]))
    let right = mergeSort(array: Array(array[midIndex...]))

    return merge(left, right)
}


func merge<Element>(_ left: [Element], _ right: [Element]) -> [Element] where Element: Comparable {

    var leftIndex = 0
    var rightIndex = 0
    var result: [Element] = []

    while ((leftIndex < left.count) && (rightIndex < right.count)) {

        let leftElement = left[leftIndex]
        let rightElement = right[rightIndex]

        if leftElement < rightElement {
            result.append(leftElement)
            leftIndex += 1
        } else if leftElement > right[rightIndex] {
            result.append(rightElement)
            rightIndex += 1
        } else {
            result.append(leftElement)
            leftIndex += 1
            result.append(rightElement)
            rightIndex += 1
        }
    }

    if leftIndex < left.count {
        result.append(contentsOf: left[leftIndex...])
    }
    if rightIndex < right.count {
        result.append(contentsOf: right[rightIndex...])
    }

    return result
}

let inputArray = [7, 2, 6, 3, 9]
print(mergeSort(array: inputArray))
