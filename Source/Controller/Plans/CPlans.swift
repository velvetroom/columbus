import Foundation

final class CPlans:Controller<ArchPlans>
{
    override func viewDidLoad()
    {
        super.viewDidLoad()

        model.load()
    }
}
