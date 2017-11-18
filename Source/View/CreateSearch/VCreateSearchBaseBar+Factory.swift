import UIKit

extension VCreateSearchBaseBar
{
    //MARK: internal
    
    func factoryViews()
    {
        let border:VBorder = VBorder(
            colour:UIColor.colourBackgroundGray)
        
        let searchBar:UISearchBar = UISearchBar(frame:CGRect.zero)
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.backgroundColor = UIColor.clear
        searchBar.searchBarStyle = UISearchBarStyle.minimal
        searchBar.showsCancelButton = true
        searchBar.tintColor = UIColor.colourBackgroundDark
        searchBar.delegate = self
        self.searchBar = searchBar
        
        addSubview(border)
        addSubview(searchBar)
        
        NSLayoutConstraint.bottomToBottom(
            view:border,
            toView:self)
        NSLayoutConstraint.height(
            view:border,
            constant:kBorderHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:border,
            toView:self)
        
        NSLayoutConstraint.topToTop(
            view:searchBar,
            toView:self,
            constant:kBarTop)
        NSLayoutConstraint.bottomToBottom(
            view:searchBar,
            toView:self)
        NSLayoutConstraint.equalsHorizontal(
            view:searchBar,
            toView:self)
    }
}
