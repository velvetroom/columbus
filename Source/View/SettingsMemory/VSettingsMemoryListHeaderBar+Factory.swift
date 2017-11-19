import UIKit

extension VSettingsMemoryListHeaderBar
{
    //MARK: internal
    
    func factoryViews()
    {
        let lineColumbus:VSettingsMemoryListHeaderBarLine = VSettingsMemoryListHeaderBarLine(
            controller:controller)
        lineColumbus.backgroundColor = UIColor.colourSuccess
        
        let lineOther:VSettingsMemoryListHeaderBarLine = VSettingsMemoryListHeaderBarLine(
            controller:controller)
        lineOther.backgroundColor = UIColor(white:0, alpha:0.2)
        
        addSubview(lineColumbus)
        addSubview(lineOther)
        
        NSLayoutConstraint.equalsVertical(
            view:lineColumbus,
            toView:self)
        NSLayoutConstraint.leftToLeft(
            view:lineColumbus,
            toView:self)
        layoutLineColumbusWidth = NSLayoutConstraint.width(
            view:lineColumbus)
        
        NSLayoutConstraint.equalsVertical(
            view:lineOther,
            toView:self)
        NSLayoutConstraint.leftToRight(
            view:lineOther,
            toView:lineColumbus)
        layoutLineOtherWidth = NSLayoutConstraint.width(
            view:lineOther)
    }
}
