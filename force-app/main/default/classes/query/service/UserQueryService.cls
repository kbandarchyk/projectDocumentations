public with sharing class UserQueryService {

    private final UserRepository userRepository;

    public UserQueryService( final UserRepository UserRepository ) {
        this.userRepository = userRepository;
    }

    public List<UserQueryDto> fetchListByIds( final List<String> ids ) {

        final List<User> userRepoDtos = userRepository.fetchListByIds( ids );

        final List<UserQueryDto> resultList = new List<UserQueryDto>();

        for( User userRepoDto: userRepoDtos ){
            resultList.add( toUserQueryDto( userRepoDto ) );
        }

        return resultList;
    }


    ////////////////////
    /// Utils
    ///////////////////

    private UserQueryDto toUserQueryDto( final User user ){
        return new UserQueryDto( user.ID, user.Name);
    }
}
