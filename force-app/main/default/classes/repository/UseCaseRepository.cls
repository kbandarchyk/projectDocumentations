public with sharing class UseCaseRepository {
    
    public List<UseCase__c> fetchListByProjectIds( final List<String> projectIds ){
        return [ SELECT Id, Name, Number__c, Description__c, Version__c, Priority__c, Project__r.Id
                 FROM UseCase__c
                 WHERE Project__r.Id IN :projectIds
                 LIMIT 50000 ];
    }
}
