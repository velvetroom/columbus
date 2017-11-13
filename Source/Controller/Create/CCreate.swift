import UIKit
import CoreLocation

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
        
        model.load()
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
            let plan:DPlan = model.plan?.plan,
            let settings:DSettings = model.settings
        
        else
        {
            return
        }
        
        let controller:CCreateSave = CCreateSave(
            database:database,
            plan:plan,
            settings:settings)
        parentController?.push(
            controller:controller,
            vertical:ControllerParent.Vertical.bottom)
    }
    
    func editTravel(
        travel:DPlanTravel)
    {
        let controller:CCreateTravel = CCreateTravel(
            controller:self,
            travel:travel)
        
        parentController?.animateOver(controller:controller)
    }
    
    func travelEdited(
        travel:DPlanTravel)
    {
        DispatchQueue.global(
            qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.model.plan?.update(travel:travel)
        }
    }
    
    func showSearch()
    {
        let controller:CCreateSearch = CCreateSearch(
            controller:self)
        
        parentController?.animateOver(controller:controller)
    }
    
    func addStop(
        coordinate:CLLocationCoordinate2D)
    {
        model.plan?.addStop(coordinate:coordinate)
    }
}
