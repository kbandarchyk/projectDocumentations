public with sharing class UseCaseFactory {

    private static final Integer FIRST_VERSION = 1;
    
    private final UseCaseRepository useCaseRepository;
    private final ProjectRepository projectRepository;

    public UseCaseFactory( final UseCaseRepository useCaseRepository
                         , final ProjectRepository projectRepository ){
        this.useCaseRepository = useCaseRepository;
        this.projectRepository = projectRepository;
    }

    public UseCase constructNew( final UseCaseCommandDto useCaseCommandDto ){

        return new UseCase( null
                          , useCaseCommandDto.name
                          , useCaseCommandDto.useCaseNumber
                          , null
                          , UseCaseStatus.IN_DEVELOPMENT
                          , FIRST_VERSION
                          , PriorityUtils.valueOf( useCaseCommandDto.priority )
                          , constructProjectOfUseCase( useCaseCommandDto.projectId ) );
    }

    public void create( final UseCase useCase ){
        useCaseRepository.create( toUseCaseRepoDto( useCase ) );
    }


    ///////////////////
    /// Utils
    ///////////////////

    private ProjectOfUseCase constructProjectOfUseCase( final String projectId ) {

        final Project__c projectRepoDto = projectRepository.fetchById( projectId );

        return new ProjectOfUseCase( projectRepoDto.Id
                                   , projectRepoDto.Name
                                   , projectRepoDto.Description__c
                                   , ProjectStatusUtils.valueOf( projectRepoDto.Status__c )
                                   , projectRepoDto.Version__c.intValue()
                                   , PriorityUtils.valueOf( projectRepoDto.Priority__c ) );
    }

    private UseCase__c toUseCaseRepoDto( final UseCase useCase ){

        return new UseCase__c( Name = useCase.getName()
                             , Number__c = useCase.getUseCaseNumber()
                             , Description__c = useCase.getDescription()
                             , Status__c = useCase.getStatus().name()
                             , Version__c = useCase.getVersion()
                             , Priority__c= useCase.getPriority().name()
                             , Project__c = useCase.getProjectOfUseCase().getId() );
    }

}
