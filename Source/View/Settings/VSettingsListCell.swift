import UIKit

class VSettingsListCell:UICollectionViewCell
{
    private(set) weak var controller:CSettings?
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        clipsToBounds = true
        backgroundColor = UIColor.white
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: internal
    
    func config(
        controller:CSettings,
        model:MSettingsProtocol)
    {
        self.controller = controller
    }
}
