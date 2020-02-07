public with sharing class UseCaseQueryDto {

    @AuraEnabled
    public final String id {get;set;}

    @AuraEnabled
    public final String name {get;set;}

    @AuraEnabled
    public final Integer useCaseNumber {get;set;}
    
    @AuraEnabled
    public final String description {get;set;}

    @AuraEnabled
    public final String status {get;set;}

    @AuraEnabled
    public final Integer version {get;set;}

    @AuraEnabled
    public final String priority {get;set;}

    @AuraEnabled
    public final String projectId {get;set;}

    public UseCaseQueryDto( final String id
                          , final String name
                          , final Integer useCaseNumber
                          , final String description
                          , final String status
                          , final Integer version
                          , final String priority
                          , final String projectId ) {
        this.id = id;
        this.name = name;
        this.useCaseNumber = useCaseNumber;
        this.description = description;
        this.status = status;
        this.version = version;
        this.priority = priority;
        this.projectId = projectId;
    }

}
