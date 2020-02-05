public with sharing class UserInformation {

    private final String id;
    private final String name;

    public UserInformation( final String id
                          , final String name ) {
        this.id = id;
        this.name = name;
        
        init();
    }

    public String getId() {
        return id;
    }

    public String getName() {
        return name;
    }
    
    private void init() {
        if( name == null ){
            throw new CreateInvalidObjectException( 'User name cant be empty' );
        }
    }
}
