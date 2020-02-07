public with sharing class ProjectFactory {
    
    private static final Integer FIRST_VERSION = 1;

    private final ProjectRepository projectRepository;
    private final UserRepository userRepository;

    public ProjectFactory( final ProjectRepository projectRepository
                         , final UserRepository userRepository ) {
        this.projectRepository = projectRepository;
        this.userRepository = userRepository;                    
    }

    public Project constructNew( final ProjectCommandDto projectCommandDto ) {
        return new Project( null
                          , projectCommandDto.name
                          , projectCommandDto.description
                          , ProjectStatus.IN_DEVELOPMENT
                          , FIRST_VERSION
                          , PriorityUtils.valueOf( projectCommandDto.priority )
                          , constructAuthor( projectCommandDto.authorId )
                          );
    }

    public Project fetchBy( final String projectId ){

        final Project__c projectRepoDto = projectRepository.fetchById( projectId );

        return constructProject( projectRepoDto );
    }

    public void creating( final Project project ){
        projectRepository.creating( toProjectRepoDto( project ) );
    }

    public void updating( final Project project ){
        projectRepository.updating( toProjectRepoDto( project ) );
    }


    ///////////////////
    /// Utils
    ///////////////////

    private Project constructProject( final Project__c projectRepoDto ){

        return new Project( projectRepoDto.Id
                          , projectRepoDto.Name
                          , projectRepoDto.Description__c
                          , ProjectStatusUtils.valueOf( projectRepoDto.Status__c )
                          , projectRepoDto.Version__c.intValue()
                          , PriorityUtils.valueOf( projectRepoDto.Priority__c ) 
                          , constructAuthor( projectRepoDto.Author__c ) );
    }

    private UserInformation constructAuthor( final String authorId ) {
        return toUserInformation( userRepository.fetchBy( UserInfo.getUserId() ) );
    }

    private UserInformation toUserInformation( final User user ) {
        return new UserInformation( user.id, user.name );
    }

    private Project__c toProjectRepoDto( final Project project ){
        return new Project__c( Id = project.getId()
                             , Name = project.getName()
                             , Description__c = project.getDescription()
                             , Status__c = project.getStatus().name()
                             , Version__c = project.getVersion()
                             , Priority__c = project.getPriority().name()
                             , Author__c = project.getAuthor().getId() );
    }

}
