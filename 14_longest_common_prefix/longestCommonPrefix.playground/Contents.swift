import Cocoa


// v1
func longestCommonPrefix(_ strs: [String]) -> String {
    if(strs.count == 1){return strs[0]}
    
    var result = ""
    var index = 1
    
    while index <= strs[0].count{
        
        let prefix = strs[0].prefix(index)
        
        for s in strs{
            if s.hasPrefix(prefix){
                continue
            }else{
                return result
            }
        }
        
        index += 1
        result = String(prefix)
    }
    
    return result
}

longestCommonPrefix(["flower","flower","flower","flower"])
