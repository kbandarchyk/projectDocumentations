public with sharing class FlatProjectQueryDto {
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

    public FlatProjectQueryDto( final String id
                              , final String name
                              , final String description
                              , final String status
                              , final Integer version
                              , final String priority ) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.status = status;
        this.version = version;
        this.priority = priority;                   
    }
}
