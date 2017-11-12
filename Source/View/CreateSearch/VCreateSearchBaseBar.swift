import UIKit

final class VCreateSearchBaseBar:View<ArchCreateSearch>
{
    private weak var searchBar:UISearchBar!
    
    required init(controller:CCreateSearch)
    {
        super.init(controller:controller)
        
        let searchBar:UISearchBar = UISearchBar(frame:CGRect.zero)
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.backgroundColor = UIColor.clear
        searchBar.searchBarStyle = UISearchBarStyle.minimal
        self.searchBar = searchBar
        
        addSubview(searchBar)
        
        NSLayoutConstraint.equals(
            view:searchBar,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
