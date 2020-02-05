public with sharing class ProjectCommandController {

    @AuraEnabled
    public static void createProject( final String name
                                    , final String description
                                    , final String priority ) {

        final ProjectApplication projectApplication = new ProjectApplication( new ProjectFactory( new ProjectRepository()
                                                                                                , new UserRepository() ) );

        projectApplication.createProject( new ProjectCommandDto( null
                                                               , name
                                                               , description
                                                               , priority ) );
    }
}
