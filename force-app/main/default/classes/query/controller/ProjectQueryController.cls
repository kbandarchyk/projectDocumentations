public with sharing class ProjectQueryController {

    @AuraEnabled( cacheable=true )
    public static List<ProjectQueryDto> fetchAll(){

        final ProjectQueryService projectQueryService 
            = new ProjectQueryService( new ProjectRepository()
                                     , new UseCaseQueryService( new UseCaseRepository() ) );

        return projectQueryService.fetchAll();
    }
}
