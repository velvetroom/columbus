import UIKit

final class VPlansDetailListHeader:UICollectionReusableView
{
    weak var labelDuration:UILabel!
    weak var labelDistance:UILabel!
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        isUserInteractionEnabled = false
        
        factoryViews()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: internal
    
    func config(controller:CPlansDetail)
    {
        guard
            
            let travels:[DPlanTravel] = controller.model.plan?.travelsList,
            let distanceSettings:DSettingsDistance = controller.model.settings?.distance
        
        else
        {
            return
        }
        
        let distance:String? = VFormat.factoryDistance(
            travels:travels,
            distanceSettings:distanceSettings)
        
        let duration:String? = VFormat.factoryDuration(travels:travels)
        
        labelDistance.text = distance
        labelDuration.text = duration
    }
}
