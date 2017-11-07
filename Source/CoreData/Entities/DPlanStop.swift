import Foundation

extension DPlanStop
{
    public override func awakeFromInsert()
    {
        draggable = true
    }
    
    public override func awakeFromFetch()
    {
        draggable = false
    }
}
