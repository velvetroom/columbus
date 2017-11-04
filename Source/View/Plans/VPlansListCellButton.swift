import UIKit

final class VPlansListCellButton:View<ArchPlans>
{
    private weak var button:UIButton!
    private weak var model:DPlan?
    
    required init(controller:CPlans)
    {
        super.init(controller:controller)
        
        let button:UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.imageView!.clipsToBounds = true
        button.imageView!.contentMode = UIViewContentMode.center
        button.addTarget(
            self,
            action:#selector(selectorButton(button:)),
            for:UIControlEvents.touchUpInside)
        self.button = button
        
        addSubview(button)
        
        NSLayoutConstraint.equals(
            view:button,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: selectors
    
    @objc
    private func selectorButton(button sender:UIButton)
    {
        guard
        
            let model:DPlan = self.model
        
        else
        {
            return
        }
        
        controller.model.activate(
            plan:model)
    }
    
    //MARK: private
    
    private func updateImage(
        image:UIImage)
    {
        button.setImage(
            image,
            for:UIControlState.normal)
        button.setImage(
            image,
            for:UIControlState.highlighted)
    }
    
    //MARK: internal
    
    func active(
        model:DPlan)
    {
        self.model = model
        updateImage(image:#imageLiteral(resourceName: "assetGenericActive"))
    }
    
    func unactive(
        model:DPlan)
    {
        self.model = model
        updateImage(image:#imageLiteral(resourceName: "assetGenericUnactive"))
    }
}
