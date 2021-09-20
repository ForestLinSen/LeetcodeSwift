import Cocoa

// Version 2:
func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {

    let count = nums1.count + nums2.count
    var midArray = [Int]()
    
    var left = 0
    var right = 0
    
    while midArray.count < count/2+1 {
        // add the smaller element
        
        // all the left elements have been added
        if(left >= nums1.count){
            midArray.append(nums2[right])
            right+=1
            
        // all the right elements have been added
        }else if(right >= nums2.count){
            midArray.append(nums1[left])
            left += 1
            
        // normal comparisons
        }else{
            if(nums1[left] < nums2[right]){
                midArray.append(nums1[left])
                left += 1
            }else{
                midArray.append(nums2[right])
                right += 1
            }

        }
        
        print(midArray)
    }
    
    
    if(count % 2 == 0){
        return (Double(midArray[count/2]) + Double(midArray[count/2-1]))/2
    }else{
        return Double(midArray[count/2])
    }

}

findMedianSortedArrays([], [2,3])

// Version 0:
//func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
//
//    var allArrays = (nums1 + nums2).sorted()
//
//    let count = allArrays.count
//    if(count % 2 == 0){
//        return (Double(allArrays[count/2]) + Double(allArrays[count/2 - 1]))/2
//    }else{
//        return Double(allArrays[count/2])
//    }
//}




