import UIKit

extension ControllerParent
{
    private static let kOrientationKey:String = "orientation"
    
    override var preferredStatusBarStyle:UIStatusBarStyle
    {
        guard
            
            let controller:UIViewController = childViewControllers.last
            
        else
        {
            return UIStatusBarStyle.default
        }
        
        return controller.preferredStatusBarStyle
    }
    
    override var prefersStatusBarHidden:Bool
    {
        guard
            
            let controller:UIViewController = childViewControllers.last
            
            else
        {
            return false
        }
        
        return controller.prefersStatusBarHidden
    }
    
    override var supportedInterfaceOrientations:UIInterfaceOrientationMask
    {
        get
        {
            return orientation
        }
    }
    
    override var shouldAutorotate:Bool
        {
        get
        {
            return true
        }
    }
    
    //MARK: private
    
    private func updateOrientation(orientation:UIInterfaceOrientation)
    {
        UIDevice.current.setValue(
            orientation.rawValue,
            forKey:ControllerParent.kOrientationKey)
        UIViewController.attemptRotationToDeviceOrientation()
    }
    
    //MARK: internal
    
    func landscapeOrientation()
    {
        orientation = UIInterfaceOrientationMask.landscape
        updateOrientation(
            orientation:UIInterfaceOrientation.landscapeLeft)
    }
    
    func portraitOrientation()
    {
        orientation = UIInterfaceOrientationMask.portrait
        updateOrientation(
            orientation:UIInterfaceOrientation.portrait)
    }
}
