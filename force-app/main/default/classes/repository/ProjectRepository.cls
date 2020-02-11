public with sharing class ProjectRepository {
    
    public List<Project__c> fetchAll() {
        return [ SELECT Id, Name, Description__c, Status__c, Version__c, Priority__c
                 FROM Project__c
                 WHERE Status__c != 'DELETED'
                 LIMIT 50000 ];
    }

    public Project__c fetchById( final String id ) {
        return [ SELECT Id, Name, Description__c, Status__c, Version__c, Priority__c
                 FROM Project__c
                 WHERE Id=: id
                 LIMIT 1];
    }

    public void creating( final Project__c projectRepoDto ) {
        insert projectRepoDto;
    }

    public void updating( final Project__c projectRepoDto ) {
        update projectRepoDto;
    }
}
