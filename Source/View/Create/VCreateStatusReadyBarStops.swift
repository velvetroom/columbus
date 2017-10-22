import UIKit

final class VCreateStatusReadyBarStops:
    VCollection<
    ArchCreate,
    VCreateStatusReadyBarStopsCell>
{
    weak var viewTravel:VCreateStatusReadyBarTravel!
    private var cellSize:CGSize?
    private let kCellHeight:CGFloat = 50
    private let kInsetsTop:CGFloat = 10
    private let kInsetsBottom:CGFloat = 6
    
    required init(controller:CCreate)
    {
        super.init(controller:controller)
        collectionView.alwaysBounceVertical = true
        
        if let flow:VCollectionFlow = collectionView.collectionViewLayout as? VCollectionFlow
        {
            flow.sectionInset = UIEdgeInsets(
                top:kInsetsTop,
                left:0,
                bottom:kInsetsBottom,
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
        
            let stops:[DPlanStop] = stopList()
        
        else
        {
            return 0
        }
        
        let count:Int = stops.count
        
        return count
    }
    
    override func collectionView(
        _ collectionView:UICollectionView,
        cellForItemAt indexPath:IndexPath) -> UICollectionViewCell
    {
        let item:DPlanStop = modelAtIndex(
            index:indexPath)
        let cell:VCreateStatusReadyBarStopsCell = cellAtIndex(
            indexPath:indexPath)
        
        cell.config(
            controller:controller,
            model:item)
        
        return cell
    }
    
    override func collectionView(
        _ collectionView:UICollectionView,
        didSelectItemAt indexPath:IndexPath)
    {
        selectedCell(indexPath:indexPath)
    }
}
