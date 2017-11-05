import UIKit

final class VStoreStatusLoading:View<ArchStore>
{
    required init(controller:CStore)
    {
        super.init(controller:controller)
        clipsToBounds = true
        isUserInteractionEnabled = false
        
        let icon:UIImageView = UIImageView()
        icon.isUserInteractionEnabled = false
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.clipsToBounds = true
        icon.contentMode = UIViewContentMode.center
        icon.image = #imageLiteral(resourceName: "assetMenuStore")
        
        addSubview(icon)
        
        NSLayoutConstraint.equals(
            view:icon,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
