import Foundation

extension MCreatePlan
{
    //MARK: internal
    
    func save(completion:@escaping(() -> ()))
    {
        database.save
        {
            completion()
        }
    }
}
