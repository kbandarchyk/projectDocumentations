public with sharing class UseCaseCommandDto {

    @AuraEnabled
    public final String id;

    @AuraEnabled
    public final String name;
    
    @AuraEnabled
    public final Integer useCaseNumber;

    @AuraEnabled
    public final String priority;

    @AuraEnabled
    public final String projectId;

    public UseCaseCommandDto( final String id
                            , final String name
                            , final Integer useCaseNumber
                            , final String priority
                            , final String projectId ) {
        this.id = id;
        this.name = name;
        this.useCaseNumber = useCaseNumber;
        this.priority = priority;
        this.projectId = projectId;                        
    }
}
