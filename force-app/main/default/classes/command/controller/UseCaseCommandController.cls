public with sharing class UseCaseCommandController {

    @AuraEnabled
    public static void createUseCase( final String name
                                    , final Integer useCaseNumber
                                    , final String priority
                                    , final String projectId ) {

        final UseCaseApplication useCaseApplication = new UseCaseApplication( new UseCaseFactory( new UseCaseRepository()
                                                                                                , new ProjectRepository() ) );

        useCaseApplication.createUseCase(  new UseCaseCommandDto( null
                                                                , name
                                                                , useCaseNumber
                                                                , priority
                                                                , projectId ) );
    }

}
