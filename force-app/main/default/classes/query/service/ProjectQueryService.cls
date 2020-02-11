public with sharing class ProjectQueryService {

    private static final String AUTHOR_NOT_FOUND = 'Author not found';
   
    private ProjectRepository projectRepository;
    private UseCaseQueryService useCaseQueryService;

    public ProjectQueryService( final ProjectRepository projectRepository
                              , final UseCaseQueryService useCaseQueryService ) {
        this.projectRepository = projectRepository;
        this.useCaseQueryService = useCaseQueryService;
    }

    public List<ProjectQueryDto> fetchAll() {

        final List<Project__c> projectRepoDtos = projectRepository.fetchAll();

        return constructProjectQueryDtoList( projectRepoDtos );
    }


    ////////////////////
    /// Utils
    ////////

    private List<ProjectQueryDto> constructProjectQueryDtoList ( final List<Project__c> projectRepoDtos ) {

        if( projectRepoDtos.isEmpty() ){
            return new List<ProjectQueryDto>();
        }

        final List<String> projectIds = constructProjectIdList( projectRepoDtos );

        final List<UseCaseQueryDto> useCaseDtos = useCaseQueryService.fetchListByProjectIds( projectIds );

        final List<ProjectQueryDto> resultList = new List<ProjectQueryDto>();

        for( Project__c projectRepoDto : projectRepoDtos ){
            resultList.add( toProjectQueryDto( projectRepoDto
                                             , useCaseDtos ) );
        }

        return resultList;
    }

    private List<String> constructProjectIdList( final List<Project__c> projectRepoDtos ){

        if( projectRepoDtos.isEmpty() ){
            return new List<String>();
        }

        final List<String> resultList = new List<String>();

        for( Project__c projectRepoDto : projectRepoDtos ){
            resultList.add( projectRepoDto.Id );
        }

        return resultList;
    }

    private ProjectQueryDto toProjectQueryDto( final Project__c projectRepoDto
                                             , final List<UseCaseQueryDto> allUseCaseQueryDtos ) {

        final List<UseCaseQueryDto> filteredUseCaseQueryDtos = filterUseCasesByProjectId( allUseCaseQueryDtos, projectRepoDto.Id );
    
        return new ProjectQueryDto( projectRepoDto.Id
                                  , projectRepoDto.Name
                                  , projectRepoDto.Description__c
                                  , projectRepoDto.Status__c
                                  , projectRepoDto.Version__c.intValue()
                                  , projectRepoDto.Priority__c
                                  , filteredUseCaseQueryDtos );
    }

    private List<UseCaseQueryDto> filterUseCasesByProjectId( final List<UseCaseQueryDto> allUseCaseQueryDtos
                                                           , final String projectId ){
        final List<UseCaseQueryDto> resultList = new List<UseCaseQueryDto>();
        
        for( UseCaseQueryDto useCaseQueryDto: allUseCaseQueryDtos ){
            if( useCaseQueryDto.projectId.equals( projectId ) ){
                resultList.add( useCaseQueryDto );
            }
        }

        return resultList;
    }

}
