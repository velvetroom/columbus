import UIKit

final class VStoreStatusReady:View<ArchStore>
{
    private(set) weak var viewList:VStoreStatusReadyList!
    
    required init(controller:CStore)
    {
        super.init(controller:controller)
        factoryViews()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: private
    
    private func factoryViews()
    {
        let viewBar:VStoreStatusReadyBar = VStoreStatusReadyBar(
            controller:controller)
        
        let viewList:VStoreStatusReadyList = VStoreStatusReadyList(
            controller:controller)
        self.viewList = viewList
        
        addSubview(viewList)
        addSubview(viewBar)
        
        NSLayoutConstraint.topToTop(
            view:viewBar,
            toView:self)
        NSLayoutConstraint.height(
            view:viewBar,
            constant:ViewMain.Constants.barHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:viewBar,
            toView:self)
        
        NSLayoutConstraint.equals(
            view:viewList,
            toView:self)
    }
}
