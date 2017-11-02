import UIKit

final class VHomeStandby:VCollection<
    ArchHome,
    VHomeStandbyCell>
{
    weak var layoutHeaderHeight:NSLayoutConstraint!
    let kHeaderHeight:CGFloat = 200
    let kHeaderMinHeight:CGFloat = 20
    let kInterItem:CGFloat = 1
    let kCollectionBottom:CGFloat = 70
    private var cellSize:CGSize?
    private let kCellHeight:CGFloat = 100
    
    required init(controller:CHome)
    {
        super.init(controller:controller)
        config()
        factoryViews()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func scrollViewDidScroll(
        _ scrollView:UIScrollView)
    {
        let offsetY:CGFloat = scrollView.contentOffset.y
        var headerHeight:CGFloat = kHeaderHeight - offsetY
        
        if headerHeight < kHeaderMinHeight
        {
            headerHeight = kHeaderMinHeight
        }
        
        layoutHeaderHeight.constant = headerHeight
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
        let count:Int = controller.model.info.count
        
        return count
    }
}
