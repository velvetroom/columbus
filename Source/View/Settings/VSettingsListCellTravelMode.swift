import UIKit

final class VSettingsListCellTravelMode:VSettingsListCell
{
    private weak var model:MSettingsTravelMode?
    private weak var viewList:VSettingsListCellTravelModeList?
    private let kTitleHeight:CGFloat = 50
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func config(
        controller:CSettings,
        model:MSettingsProtocol)
    {
        super.config(
            controller:controller,
            model:model)
        
        guard
        
            let model:MSettingsTravelMode = model as? MSettingsTravelMode
        
        else
        {
            return
        }
        
        self.model = model
        
        factoryList()
    }
    
    //MARK: private
    
    private func factoryList()
    {
        guard
        
            self.viewList == nil,
            let controller:CSettings = self.controller
        
        else
        {
            self.viewList?.collectionView.reloadData()
            
            return
        }
        
        let viewList:VSettingsListCellTravelModeList = VSettingsListCellTravelModeList(
            controller:controller)
        self.viewList = viewList
        
        addSubview(viewList)
        
        NSLayoutConstraint.topToTop(
            view:viewList,
            toView:self,
            constant:kTitleHeight)
        NSLayoutConstraint.bottomToBottom(
            view:viewList,
            toView:self)
        NSLayoutConstraint.equalsHorizontal(
            view:viewList,
            toView:self)
    }
}
