public with sharing class WellnessJourneyRewardsBatch implements Database.Batchable<AggregateResult>, Database.AllowsCallouts {
    
    public Iterable<AggregateResult> start(Database.BatchableContext bc) {
        return WellnessJourneyDAO.getCompletedWellnessJourney();
    }

    public void execute(Database.BatchableContext bc, List<AggregateResult> records) {

        for(AggregateResult result : records) {
            String id = (String) result.get('OwnerId');
            String name = (String) result.get('Name');
            String email = (String) result.get('Email');
            String username = (String) result.get('Username');
            String wellnessRecord = JSON.serialize(new WellnessJourneyVO(id, name, email, username));
            HttpResponse response = submitUsersForRewardCallout(wellnessRecord);
            System.debug(response.getStatusCode());
        }
          
    }

    public void finish(Database.BatchableContext bc) {
        System.debug('Batch Process Finished');
    }
    
    public HttpResponse submitUsersForRewardCallout(String jsonBody) {
        return RewardsCalloutService.callOutUserRewards(jsonBody);
    }

}