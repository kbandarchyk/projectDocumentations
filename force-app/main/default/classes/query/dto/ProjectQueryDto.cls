public with sharing class ProjectQueryDto {

    @AuraEnabled
    public final String id {get;set;}

    @AuraEnabled
    public final String name {get;set;}

    @AuraEnabled
    public final String description {get;set;}

    @AuraEnabled
    public final String status {get;set;}

    @AuraEnabled
    public final Integer version {get;set;}

    @AuraEnabled
    public final String priority {get;set;}

    @AuraEnabled
    public final UserQueryDto author {get;set;}

    @AuraEnabled
    public final List<UseCaseQueryDto> useCases;

    public ProjectQueryDto( final String id
                          , final String name
                          , final String description
                          , final String status
                          , final Integer version
                          , final String priority
                          , final UserQueryDto author
                          , final List<UseCaseQueryDto> useCases ) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.status = status;
        this.version = version;
        this.priority = priority;
        this.author = author;
        this.useCases = useCases;                      
    }

}
