public with sharing class UserQueryDto {

    @AuraEnabled
    public final String id;

    @AuraEnabled
    public final String name;

    public UserQueryDto( final String id
                       , final String name ) {
        this.id = id;
        this.name = name;                
    }

}
