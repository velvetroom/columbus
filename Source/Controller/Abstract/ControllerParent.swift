import UIKit

final class ControllerParent:UIViewController
{
    var orientation:UIInterfaceOrientationMask
    let menu:MMenu
    
    init()
    {
        menu = MMenu()
        orientation = UIInterfaceOrientationMask.portrait
        super.init(nibName:nil, bundle:nil)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        guard
            
            let controller:UIViewController = selectedController()
            
        else
        {
            return
        }
        
        mainController(controller:controller)
    }
    
    override func loadView()
    {
        let viewParent:ViewParent = ViewParent(controller:self)
        view = viewParent
    }
}
