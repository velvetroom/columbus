import Foundation

extension DSettings
{
    public override func awakeFromInsert()
    {
        travelMode = DPlanTravelMode.walking
        detailLevel = DSettingsDetailLevel.medium
    }
}
