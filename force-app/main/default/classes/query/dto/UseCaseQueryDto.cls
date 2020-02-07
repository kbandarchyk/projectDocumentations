public with sharing class UseCaseQueryDto {

    @AuraEnabled
    public final String id;

    @AuraEnabled
    public final String name;

    @AuraEnabled
    public final Integer useCaseNumber;
    
    @AuraEnabled
    public final String description;

    @AuraEnabled
    public final String status;

    @AuraEnabled
    public final Integer version;

    @AuraEnabled
    public final String priority;

    @AuraEnabled
    public final String projectId;

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
