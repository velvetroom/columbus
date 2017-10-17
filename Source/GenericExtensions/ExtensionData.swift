import Foundation

extension Data
{
    private static let kDot:String = "."
    
    //MARK: internal
    
    func writeToTemporal(withExtension:String?) -> URL?
    {
        var randomName:String = UUID().uuidString
        
        if let withExtension:String = withExtension
        {
            randomName.append(Data.kDot)
            randomName.append(withExtension)
        }
        
        let directoryUrl:URL = URL(fileURLWithPath:NSTemporaryDirectory())
        let fileUrl:URL = directoryUrl.appendingPathComponent(randomName)
        
        do
        {
            try write(
                to:fileUrl,
                options:Data.WritingOptions.atomicWrite)
        }
        catch
        {
            return nil
        }
        
        return fileUrl
    }
    
    mutating func append<T>(value:T)
    {
        var value:T = value
        let buffer:UnsafeBufferPointer = UnsafeBufferPointer(
            start:&value,
            count:1)
        
        append(buffer)
    }
    
    func arrayFromBytes<T>(elements:Int) -> [T]?
    {   
        let valueSize:Int = MemoryLayout<T>.size
        let expectedSize:Int = elements * valueSize
        
        guard
            
            count >= expectedSize
        
        else
        {
            return nil
        }
        
        let array:[T] = withUnsafeBytes
        { (pointer:UnsafePointer<T>) -> [T] in
            
            let bufferPointer:UnsafeBufferPointer = UnsafeBufferPointer(
                start:pointer,
                count:elements)
            let array:[T] = Array(bufferPointer)
            
            return array
        }
        
        return array
    }
    
    func valueFromBytes<T>() -> T?
    {
        guard
        
            let array:[T] = arrayFromBytes(elements:1),
            let value:T = array.first
        
        else
        {
            return nil
        }
        
        return value
    }
    
    func subdata(
        start:Int,
        endNotIncluding:Int) -> Data
    {
        let range:Range<Data.Index> = Range<Data.Index>(
            start ..< endNotIncluding)
        let sliced:Data = subdata(in:range)
        
        return sliced
    }
    
    func subdata(start:Int) -> Data
    {
        let sliced:Data = subdata(
            start:start,
            endNotIncluding:count)
        
        return sliced
    }
    
    func subdata(endNotIncluding:Int) -> Data
    {
        let sliced:Data = subdata(
            start:0,
            endNotIncluding:endNotIncluding)
        
        return sliced
    }
}
