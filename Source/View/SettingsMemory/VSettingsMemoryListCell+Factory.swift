import UIKit

extension VSettingsMemoryListCell
{
    //MARK: internal
    
    func factoryViews()
    {
        let labelOrigin:UILabel = UILabel()
        labelOrigin.translatesAutoresizingMaskIntoConstraints = false
        self.labelOrigin = labelOrigin
        
        addSubview(labelOrigin)
    }
}
