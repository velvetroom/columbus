import UIKit

extension VHomeReadyBar
{
    //MARK: internal
    
    func factoryViews()
    {
        let border:VBorder = VBorder(colour:UIColor.colourBackgroundDark)
        
        let viewList:VHomeReadyBarList = VHomeReadyBarList(controller:controller)
        self.viewList = viewList
        
        let viewHeader:VHomeReadyBarHeader = VHomeReadyBarHeader(controller:controller)
        
        addSubview(viewList)
        addSubview(viewHeader)
        addSubview(border)
        
        NSLayoutConstraint.topToTop(
            view:border,
            toView:self)
        NSLayoutConstraint.height(
            view:border,
            constant:ViewMain.Constants.borderWidth)
        NSLayoutConstraint.equalsHorizontal(
            view:border,
            toView:self)
        
        NSLayoutConstraint.equals(
            view:viewList,
            toView:self)
        
        NSLayoutConstraint.topToTop(
            view:viewHeader,
            toView:self)
        NSLayoutConstraint.height(
            view:viewHeader,
            constant:VHomeReadyBar.Constants.headerHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:viewHeader,
            toView:self)
    }
}
