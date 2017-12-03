import UIKit

final class VSettingsMemoryListHeaderBarLine:View<ArchSettingsMemory>
{
    required init(controller:CSettingsMemory)
    {
        super.init(controller:controller)
        isUserInteractionEnabled = false
        
        let border:VBorder = VBorder(colour:UIColor.white)
        
        addSubview(border)
        
        NSLayoutConstraint.equalsVertical(
            view:border,
            toView:self)
        NSLayoutConstraint.rightToRight(
            view:border,
            toView:self)
        NSLayoutConstraint.width(
            view:border,
            constant:ViewMain.Constants.borderWidth)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
