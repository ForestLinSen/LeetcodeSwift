import Cocoa

func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
    
    var table: [[[Int]]] = Array(repeating: [], count: target+1)
    

    for num in nums{
        table[num].append([num])
    }
    
    for i in 1..<table.count{
        if(table[i].first != nil){
            for num in nums{
                if i+num < table.count{
                    table[i].forEach { intArray in
                        
                        if(intArray.filter({$0 == num}).count < nums.filter({$0 == num}).count){
                            var tmp = intArray
                            tmp.insert(num, at: 0)
                            table[i+num].append(tmp)
                        }

                    }
                }
    
            }
        }
    }
    
    
    var result = [[Int]]()
    
    table[target] = Array(Set(table[target]))
    
    for array in table[target]{
        if(array.count == 4){
            result.append(array.sorted())
        }
    }
    
    return result
}

fourSum([2,2,2,2,2], 8)
