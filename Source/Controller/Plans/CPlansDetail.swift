import UIKit

final class CPlansDetail:Controller<ArchPlansDetail>
{
    init(
        database:Database,
        settings:DSettings,
        plan:DPlan)
    {
        super.init()
        
        model.config(
            database:database,
            plan:plan,
            settings:settings)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: private
    
    private func deleteConfirmed()
    {
        view.isUserInteractionEnabled = false
        model.delete()
    }
    
    //MARK: internal
    
    func back()
    {
        parentController?.pop(horizontal:ControllerTransition.Horizontal.right)
    }
    
    func confirmDelete()
    {
        let alert:UIAlertController = UIAlertController(
            title:String.localizedController(key:"CPlansDetail_alertDeleteTitle"),
            message:nil,
            preferredStyle:UIAlertControllerStyle.actionSheet)
        
        let actionCancel:UIAlertAction = UIAlertAction(
            title:String.localizedController(key:"CPlansDetail_alertDeleteCancel"),
            style:UIAlertActionStyle.cancel)
        
        let actionDelete:UIAlertAction = UIAlertAction(
            title:String.localizedController(key:"CPlansDetail_alertDeleteDelete"),
            style:UIAlertActionStyle.destructive)
        { [weak self] (action:UIAlertAction) in
            
            self?.deleteConfirmed()
        }
        
        alert.addAction(actionDelete)
        alert.addAction(actionCancel)
        
        if let popover:UIPopoverPresentationController = alert.popoverPresentationController
        {
            popover.sourceView = view
            popover.sourceRect = CGRect.zero
            popover.permittedArrowDirections = UIPopoverArrowDirection.up
        }
        
        present(alert, animated:true, completion:nil)
    }
}
