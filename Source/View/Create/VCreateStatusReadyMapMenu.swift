import UIKit

final class VCreateStatusReadyMapMenu:VCollection<
    ArchCreate,
    VCreateStatusReadyMapMenuCell>
{
    weak var layoutHeight:NSLayoutConstraint!
    let kAnimationDuration:TimeInterval = 0.3
    private var cellSize:CGSize?
    private let kCollectionTop:CGFloat = 6
    private let kCellHeight:CGFloat = 58
    private let kDeselectTime:TimeInterval = 0.5
    
    required init(controller:CCreate)
    {
        super.init(controller:controller)
        alpha = 0
        collectionView.isScrollEnabled = false
        collectionView.bounces = false
        
        if let flow:VCollectionFlow = collectionView.collectionViewLayout as? VCollectionFlow
        {
            flow.sectionInset = UIEdgeInsets(
                top:kCollectionTop,
                left:0,
                bottom:0,
                right:0)
        }
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
        guard
        
            let count:Int = controller.model.mapStatus?.menuItems.count
        
        else
        {
            return 0
        }
        
        let cellsHeight:CGFloat = CGFloat(count) * kCellHeight
        let totalHeight:CGFloat = cellsHeight + kCollectionTop
        layoutHeight.constant = totalHeight
        
        return count
    }
    
    override func collectionView(
        _ collectionView:UICollectionView,
        cellForItemAt indexPath:IndexPath) -> UICollectionViewCell
    {
        let item:MCreateMapMenuProtocol = modelAtIndex(
            index:indexPath)
        let cell:VCreateStatusReadyMapMenuCell = cellAtIndex(
            indexPath:indexPath)
        cell.config(model:item)
        
        return cell
    }
    
    override func collectionView(
        _ collectionView:UICollectionView,
        didSelectItemAt indexPath:IndexPath)
    {
        collectionView.isUserInteractionEnabled = false
        
        let item:MCreateMapMenuProtocol = modelAtIndex(
            index:indexPath)
        controller.menuItemSelected(item:item)
        
        DispatchQueue.main.asyncAfter(
            deadline:DispatchTime.now() + kDeselectTime)
        { [weak collectionView] in
            
            collectionView?.isUserInteractionEnabled = true
            collectionView?.selectItem(
                at:nil,
                animated:true,
                scrollPosition:UICollectionViewScrollPosition())
        }
    }
}
