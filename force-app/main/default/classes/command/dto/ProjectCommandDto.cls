public with sharing class ProjectCommandDto {
    @AuraEnabled
    public final String id;

    @AuraEnabled
    public final String name;

    @AuraEnabled
    public final String description;

    @AuraEnabled
    public final String priority;

    @AuraEnabled
    public final String authorId;

    public ProjectCommandDto( final String id
                            , final String name
                            , final String description
                            , final String priority
                            , final String authorId ) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.priority = priority;                  
        this.authorId = authorId; 
    }
}
