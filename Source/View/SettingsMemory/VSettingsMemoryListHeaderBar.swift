import UIKit

final class VSettingsMemoryListHeaderBar:View<ArchSettingsMemory>
{
    weak var layoutLineColumbusWidth:NSLayoutConstraint!
    weak var layoutLineOtherWidth:NSLayoutConstraint!
    
    required init(controller:CSettingsMemory)
    {
        super.init(controller:controller)
        isUserInteractionEnabled = false
        backgroundColor = UIColor.colourBackgroundGray
        layer.cornerRadius = VSettingsMemoryListHeaderBar.Constants.cornerRadius
        
        factoryViews()
        animateLines()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: private
    
    private func animateLines()
    {
        let deadline:DispatchTime = DispatchTime.now() + VSettingsMemoryListHeaderBar.Constants.waitAnimation
        DispatchQueue.main.asyncAfter(deadline:deadline)
        { [weak self] in
            
            self?.asyncAnimateLines()
        }
    }
    
    private func asyncAnimateLines()
    {
        guard
        
            let columbusWidth:CGFloat = factoryColumbusWidth(),
            let otherWidth:CGFloat = factoryOtherWidth()
        
        else
        {
            return
        }
        
        animateLines(
            columbusWidth:columbusWidth,
            otherWidth:otherWidth)
    }
    
    private func animateLines(
        columbusWidth:CGFloat,
        otherWidth:CGFloat)
    {
        layoutLineColumbusWidth.constant = columbusWidth
        
        UIView.animate(withDuration:VSettingsMemoryListHeaderBar.Constants.columbusAnimation,
        animations:
        { [weak self] in
            
            self?.layoutIfNeeded()
        })
        { [weak self] (done:Bool) in
            
            self?.layoutLineOtherWidth.constant = otherWidth
            
            UIView.animate(withDuration:VSettingsMemoryListHeaderBar.Constants.otherAnimation)
            { [weak self] in
                
                self?.layoutIfNeeded()
            }
        }
    }
    
    private func factoryColumbusWidth() -> CGFloat?
    {
        guard
        
            let columbusPercent:CGFloat = controller.model.system?.columbusPercent
        
        else
        {
            return nil
        }
        
        let width:CGFloat = bounds.width
        let columbusWidth:CGFloat = columbusPercent * width
        
        return columbusWidth
    }
    
    private func factoryOtherWidth() -> CGFloat?
    {
        guard
            
            let otherPercent:CGFloat = controller.model.system?.otherPercent
            
        else
        {
            return nil
        }
        
        let width:CGFloat = bounds.width
        let otherWidth:CGFloat = otherPercent * width
        
        return otherWidth
    }
}
