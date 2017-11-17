import Foundation

extension MCreateSave
{
    struct Constants
    {
        struct Tile
        {
            static let padding:Double = 1
            static let size:Double = 256
            static let scale:Double = 2
        }
        
        struct Timers
        {
            static let asyncWait:TimeInterval = 0.2
            static let renderTimeout:TimeInterval = 9
        }
        
        struct Map
        {
            static let appleToGoogle:Double = 1048575
            static let sizeMultiplier:Double = 1000000
        }
        
        struct File
        {
            static let projectsDirectory:String = "projects"
        }
        
        struct Slice
        {
            static let maxSize:Double = 10
        }
        
        struct Strings
        {
            static let dot:String = "."
        }
    }
}
