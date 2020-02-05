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
                          , Priority.valueOf( projectCommandDto.priority ) 
                          , constructAuthor()
                          );
    }

    public void create( final Project project ){
        projectRepository.create( toProjectRepoDto( project ) );
    }


    ///////////////////
    /// Utils
    ///////////////////

    private UserInformation constructAuthor() {

        final User authorRepoDto = userRepository.fetchBy( UserInfo.getUserId() );
        return new UserInformation( authorRepoDto.id, authorRepoDto.name );

    }

    private Project__c toProjectRepoDto( final Project project ){
        return new Project__c( Name = project.getName()
                             , Description__c = project.getDescription()
                             , Status__c = project.getStatus().name()
                             , Version__c = project.getVersion()
                             , Priority__c = project.getPriority().name()
                             , Author__c = project.getAuthor().getId() );
    }
}
