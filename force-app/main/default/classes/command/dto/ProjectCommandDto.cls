public with sharing class ProjectCommandDto {
    @AuraEnabled
    public final String id;

    @AuraEnabled
    public final String name;

    @AuraEnabled
    public final String description;

    @AuraEnabled
    public final String priority;

    public ProjectCommandDto( final String id
                            , final String name
                            , final String description
                            , final String priority ) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.priority = priority;                   
    }
}
