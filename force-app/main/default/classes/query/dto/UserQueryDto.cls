public with sharing class UserQueryDto {

    @AuraEnabled
    public final String id {get;set;}

    @AuraEnabled
    public final String name {get;set;}

    public UserQueryDto( final String id
                       , final String name ) {
        this.id = id;
        this.name = name;                
    }

}
