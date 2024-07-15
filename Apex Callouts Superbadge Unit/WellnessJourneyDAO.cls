public with sharing class WellnessJourneyDAO {

    public static List<AggregateResult> getCompletedWellnessJourney() {
        return [SELECT
                    COUNT(Id),
                    OwnerId,
                    Owner.Name,
                    Owner.Username,
                    Owner.Email   
                FROM
                    Wellness_Journey__c 
                WHERE
                    CreatedDate = THIS_QUARTER 
                GROUP BY
                    OwnerId,
                    Owner.Name,
                    Owner.Username,
                    Owner.Email
                HAVING
                    COUNT(Id) >= 12];
    }

}