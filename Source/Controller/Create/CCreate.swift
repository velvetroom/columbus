import UIKit

final class CCreate:Controller<ArchCreate>
{
    private var statusBarStyle:UIStatusBarStyle
    
    override init()
    {
        statusBarStyle = UIStatusBarStyle.default
        
        super.init()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override var preferredStatusBarStyle:UIStatusBarStyle
    {
        get
        {
            return statusBarStyle
        }
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        model.checkAuthorization()
    }
    
    //MARK: internal
    
    func lightStatusBar()
    {
        statusBarStyle = UIStatusBarStyle.lightContent
        setNeedsStatusBarAppearanceUpdate()
    }
    
    func moveToPlans()
    {
        guard
            
            let viewParent:ViewParent = parentController?.view as? ViewParent
            
        else
        {
            return
        }
        
        let order:MMenuOrder = MMenuOrder.plans
        viewParent.viewMenu.synthSelect(
            order:order)
    }
}
