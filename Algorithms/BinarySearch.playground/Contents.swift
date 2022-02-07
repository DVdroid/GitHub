
let inputArray = [12, 10, 8, 6, 4, 2].sorted()
let numberToSearch = 2

func binarySearch(number: Int,
                  in array: [Int],
                  from startIndex: Int,
                  to endIndex: Int) -> Int {

    if endIndex >= startIndex {
        let midIndex = startIndex + (endIndex - startIndex) / 2
        if array[midIndex] == number {
            return midIndex
        }

        if array[midIndex] > number {
            //Search in left part
            return binarySearch(number: number,
                                in: array,
                                from: startIndex,
                                to: (midIndex - 1))
        }

        //Search in right part
        return binarySearch(number: number,
                            in: array,
                            from: (midIndex + 1),
                            to: endIndex)
    }

    return -1
}

print(binarySearch(number: numberToSearch,
                   in: inputArray,
                   from: 0,
                   to: (inputArray.count - 1)))



//Can't break array as we have to get the exact index of the array we are searching for
func binarySearch<Element>(element: Element, in array: [Element], from startIndex: Int, to endIndex: Int) -> Int where Element: Comparable {

    let midIndex = startIndex + (endIndex - startIndex) / 2
    if endIndex >= startIndex {

        if array[midIndex] == element {
            return midIndex
        }

        if array[midIndex] > element {
            return binarySearch(element: element, in: array, from: startIndex, to: (midIndex - 1))
        }

        return binarySearch(element: element, in: array, from: (midIndex + 1), to: endIndex)
    }

    return -1
}

let input = ["Anand", "Vaibhav", "Sushil", "Suman", "Vikash", "Kartik"].sorted()
print(input)
print(binarySearch(element: "Sushil", in: input, from: 0, to: (input.count - 1)))


























































