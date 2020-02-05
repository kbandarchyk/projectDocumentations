public with sharing class ProjectRepository {
    
    public List<Project__c> fetchAll() {
        return [ SELECT Id, Name, Description__c, Status__c, Version__c, Priority__c, Author__r.Id
                 FROM Project__c
                 LIMIT 50000 ];
    }

    public void create( final Project__c projectRepoDto ) {
        insert projectRepoDto;
    }
}
