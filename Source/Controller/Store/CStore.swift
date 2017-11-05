import Foundation

final class CStore:Controller<ArchStore>
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        model.load()
    }
}
