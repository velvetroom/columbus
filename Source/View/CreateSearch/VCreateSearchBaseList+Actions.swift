import MapKit

extension VCreateSearchBaseList
{
    //MARK: internal
    
    func modelAtIndex(index:IndexPath) -> MKLocalSearchCompletion
    {
        let item:MKLocalSearchCompletion = controller.model.items[index.item]
        
        return item
    }
    
    func update()
    {
        let rect:CGRect = CGRect(x:0, y:0, width:1, height:1)
        
        collectionView.reloadData()
        collectionView.scrollRectToVisible(
            rect,
            animated:true)
    }
}
