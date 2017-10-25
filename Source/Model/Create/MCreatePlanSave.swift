import Foundation

extension MCreatePlan
{
    //MARK: internal
    
    func save(completion:@escaping(() -> ()))
    {
        model?.database?.save
        {
            completion()
        }
    }
}
