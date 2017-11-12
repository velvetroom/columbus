import MapKit

final class VCreateSearchBaseList:VCollection
    <ArchCreateSearch,
    VCreateSearchBaseListCell>
{
    let kCollectionTop:CGFloat = 78
    let kInterItem:CGFloat = 1
    private let kCellHeight:CGFloat = 62
    private var cellSize:CGSize?
    
    required init(controller:CCreateSearch)
    {
        super.init(controller:controller)
        config()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func collectionView(
        _ collectionView:UICollectionView,
        layout collectionViewLayout:UICollectionViewLayout,
        sizeForItemAt indexPath:IndexPath) -> CGSize
    {
        guard
        
            let cellSize:CGSize = self.cellSize
        
        else
        {
            let width:CGFloat = collectionView.bounds.width
            let cellSize:CGSize = CGSize(
                width:width,
                height:kCellHeight)
            self.cellSize = cellSize
            
            return cellSize
        }
        
        return cellSize
    }
    
    override func collectionView(
        _ collectionView:UICollectionView,
        numberOfItemsInSection section:Int) -> Int
    {
        let count:Int = controller.model.items.count
        
        return count
    }
    
    override func collectionView(
        _ collectionView:UICollectionView,
        cellForItemAt indexPath:IndexPath) -> UICollectionViewCell
    {
        let item:MKLocalSearchCompletion = modelAtIndex(
            index:indexPath)
        let cell:VCreateSearchBaseListCell = cellAtIndex(
            indexPath:indexPath)
        cell.config(model:item)
        
        return cell
    }
    
    override func collectionView(
        _ collectionView:UICollectionView,
        didSelectItemAt indexPath:IndexPath)
    {
        let item:MKLocalSearchCompletion = modelAtIndex(
            index:indexPath)
        controller.selected(item:item)
    }
}
