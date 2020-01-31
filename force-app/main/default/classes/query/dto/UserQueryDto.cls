public with sharing class UserQueryDto {

    private final String id;
    private final String name;

    public UserQueryDto( final String id
                       , final String name ) {
        this.id = id;
        this.name = name;                
    }

    public String getId(){
        return this.id;
    }

    public String getName(){
        return this.name;
    }
}
