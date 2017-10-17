import Foundation

class Model<A:Arch> where A.V:ViewMain
{
    weak var view:A.V?
    
    required init()
    {
    }
}
