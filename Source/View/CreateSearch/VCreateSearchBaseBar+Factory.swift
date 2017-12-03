import UIKit

extension VCreateSearchBaseBar
{
    //MARK: internal
    
    func factoryViews()
    {
        let border:VBorder = VBorder(colour:UIColor.colourBackgroundGray)
        
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
            constant:ViewMain.Constants.borderWidth)
        NSLayoutConstraint.equalsHorizontal(
            view:border,
            toView:self)
        
        NSLayoutConstraint.topToTop(
            view:searchBar,
            toView:self,
            constant:VCreateSearchBaseBar.Constants.barTop)
        NSLayoutConstraint.bottomToBottom(
            view:searchBar,
            toView:self)
        NSLayoutConstraint.equalsHorizontal(
            view:searchBar,
            toView:self)
    }
}
