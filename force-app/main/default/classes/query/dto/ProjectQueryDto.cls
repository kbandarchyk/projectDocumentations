public with sharing class ProjectQueryDto {

    @AuraEnabled
    public final String id;

    @AuraEnabled
    public final String name;

    @AuraEnabled
    public final String description;

    @AuraEnabled
    public final String status;

    @AuraEnabled
    public final Integer version;

    @AuraEnabled
    public final String priority;

    @AuraEnabled
    public final UserQueryDto author;

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
