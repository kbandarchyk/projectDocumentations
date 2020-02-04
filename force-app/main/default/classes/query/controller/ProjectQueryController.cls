public with sharing class ProjectQueryController {

    @AuraEnabled( cacheable=true )
    public static List<ProjectQueryDto> fetchAll(){

        final ProjectQueryService projectQueryService 
            = new ProjectQueryService( new ProjectRepository()
                                     , new UseCaseQueryService( new UseCaseRepository() )
                                     , new UserQueryService( new UserRepository( ) ) );

        return projectQueryService.fetchAll();
    }
}
