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
    
    func save()
    {
        guard
            
            let database:Database = model.database,
            let plan:DPlan = model.plan?.plan
        
        else
        {
            return
        }
        
        let controller:CCreateSave = CCreateSave(
            database:database,
            plan:plan)
        parentController?.push(
            controller:controller,
            vertical:ControllerParent.Vertical.bottom)
    }
}
