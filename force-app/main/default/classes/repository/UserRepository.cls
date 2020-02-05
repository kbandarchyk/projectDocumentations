public with sharing class UserRepository {
    
    public List<User> fetchListByIds( final List<String> ids ){
        return [ SELECT Id, Name 
                 FROM User
                 WHERE Id IN : ids
                 LIMIT 50000 ];
    }

    public User fetchBy( final String id ){
        return [ SELECT Id, Name
                 FROM User
                 WHERE Id =: id ];
    } 
}
