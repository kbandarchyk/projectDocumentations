public with sharing class FlatProjectQueryService {

    private final ProjectRepository projectRepository;

    public FlatProjectQueryService( final ProjectRepository projectRepository ) {
        this.projectRepository = projectRepository;
    }

    public List<FlatProjectQueryDto> fetchAll(){
        
        final List<Project__c> projectRepoDtos = projectRepository.fetchAll();

        final List<FlatProjectQueryDto> resultList = new List<FlatProjectQueryDto>();

        for( Project__c projectRepoDto : projectRepoDtos ){
            resultList.add( toFlatProjectQueryDto( projectRepoDto ) );
        }

        return resultList;
    }

    public FlatProjectQueryDto fetchBy( final String projectId ){

        final Project__c projectRepoDto = projectRepository.fetchById( projectId );

        return toFlatProjectQueryDto( projectRepoDto );
    }


    ///////////////
    /// Utils
    ///////////////

    private FlatProjectQueryDto toFlatProjectQueryDto( final Project__c projectRepoDto ) {
        return new FlatProjectQueryDto( projectRepoDto.Id
                                      , projectRepoDto.Name
                                      , projectRepoDto.Description__c
                                      , projectRepoDto.Status__c
                                      , projectRepoDto.Version__c.intValue()
                                      , projectRepoDto.Priority__c );
    }
}
