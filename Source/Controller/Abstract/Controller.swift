import UIKit

class Controller<A>:UIViewController where A.M:Model<A>
{
    let model:A.M
    
    var parentController:ControllerParent?
    {
        get
        {
            guard
                
                let parent:ControllerParent = self.parent as? ControllerParent
                
            else
            {
                return nil
            }
            
            return parent
        }
    }
    
    init()
    {
        model = A.M()
        
        super.init(nibName:nil, bundle:nil)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override var shouldAutorotate:Bool
    {
        get
        {
            return true
        }
    }
    
    override var preferredStatusBarStyle:UIStatusBarStyle
    {
        get
        {
            return UIStatusBarStyle.default
        }
    }
    
    override var prefersStatusBarHidden:Bool
    {
        get
        {
            return false
        }
    }
    
    override func loadView()
    {
        let view:A.V = A.V(controller:self)
        model.view = view
        self.view = view
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        edgesForExtendedLayout = UIRectEdge()
        extendedLayoutIncludesOpaqueBars = false
        
        if #available(iOS 11.0, *)
        {
            additionalSafeAreaInsets = UIEdgeInsets.zero
        }
        else
        {
            automaticallyAdjustsScrollViewInsets = false
        }
    }
    
    override func viewWillAppear(_ animated:Bool)
    {
        super.viewWillAppear(animated)
        
        parent?.setNeedsStatusBarAppearanceUpdate()
    }
    
    override func viewDidAppear(_ animated:Bool)
    {
        super.viewDidAppear(animated)
        
        Analytics.setScreenView(controller:self)
    }
}
