public with sharing class UseCaseCommandController {

    @AuraEnabled
    public static void createUseCase( final String name
                                    , final Integer useCaseNumber
                                    , final String priority
                                    , final String projectId ) {

        final UseCaseCommandApplication useCaseCommandApplication = new UseCaseCommandApplication( new UseCaseFactory( new UseCaseRepository()
                                                                                                                     , new ProjectRepository() ) );

        useCaseCommandApplication.createUseCase(  new UseCaseCommandDto( null
                                                                       , name
                                                                       , useCaseNumber
                                                                       , priority
                                                                       , projectId ) );
    }

}
