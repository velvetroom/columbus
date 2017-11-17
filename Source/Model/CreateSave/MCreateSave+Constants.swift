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
        
        struct TimeIntervals
        {
            static let snapshotWait:TimeInterval = 0.2
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
    }
}
