import Foundation

final class CCreate:Controller<ArchCreate>
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        model.checkAuthorization()
    }
}
