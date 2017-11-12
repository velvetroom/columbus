import UIKit

final class VCreateSearchBaseBar:
    View<ArchCreateSearch>,
    UISearchBarDelegate
{
    weak var searchBar:UISearchBar!
    let kBorderHeight:CGFloat = 1
    
    required init(controller:CCreateSearch)
    {
        super.init(controller:controller)
        
        factoryViews()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: delegate
    
    func searchBarCancelButtonClicked(
        _ searchBar:UISearchBar)
    {
        controller.back()
    }
    
    func searchBarSearchButtonClicked(
        _ searchBar:UISearchBar)
    {
        searchBar.resignFirstResponder()
    }
    
    func searchBar(
        _ searchBar:UISearchBar,
        textDidChange searchText:String)
    {
        controller.model.complete(
            string:searchText)
    }
}
