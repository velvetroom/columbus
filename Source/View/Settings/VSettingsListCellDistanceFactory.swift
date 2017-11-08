import UIKit

extension VSettingsListCellDistance
{
    //MARK: selectors
    
    @objc
    private func selectorSegemented(
        sender segmented:UISegmentedControl)
    {
        let index:Int = segmented.selectedSegmentIndex
        model?.selected(index:index)
    }
    
    //MARK: internal
    
    func factoryTitle()
    {
        let labelTitle:UILabel = UILabel()
        labelTitle.isUserInteractionEnabled = false
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.backgroundColor = UIColor.clear
        labelTitle.font = UIFont.regular(size:kTitleFontSize)
        labelTitle.textColor = UIColor.colourBackgroundDark
        labelTitle.text = String.localizedView(
            key:"VSettingsListCellDistance_labelTitle")
        
        addSubview(labelTitle)
        
        NSLayoutConstraint.topToTop(
            view:labelTitle,
            toView:self)
        NSLayoutConstraint.height(
            view:labelTitle,
            constant:kTitleHeight)
        NSLayoutConstraint.leftToLeft(
            view:labelTitle,
            toView:self,
            constant:kTitleLeft)
        NSLayoutConstraint.rightToRight(
            view:labelTitle,
            toView:self)
    }
    
    func factorySegmented(
        model:MSettingsDistance)
    {
        guard
            
            self.viewSegmented == nil
        
        else
        {
            return
        }
        
        let titles:[String] = model.itemsTitle()
        let viewSegmented:UISegmentedControl = UISegmentedControl(
            items:titles)
        viewSegmented.translatesAutoresizingMaskIntoConstraints = false
        viewSegmented.tintColor = UIColor.colourBackgroundDark
        viewSegmented.addTarget(
            self,
            action:#selector(selectorSegemented(sender:)),
            for:UIControlEvents.valueChanged)
        self.viewSegmented = viewSegmented
        
        addSubview(viewSegmented)
        
        NSLayoutConstraint.topToTop(
            view:viewSegmented,
            toView:self,
            constant:kSegmentedTop)
        NSLayoutConstraint.height(
            view:viewSegmented,
            constant:kSegmentedHeight)
        NSLayoutConstraint.width(
            view:viewSegmented,
            constant:kSegmentedWidth)
        layoutSegmentedLeft = NSLayoutConstraint.leftToLeft(
            view:viewSegmented,
            toView:self)
    }
}
