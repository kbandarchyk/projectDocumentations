public with sharing class ProjectCommandController {

    @AuraEnabled
    public static void createProject( final String name
                                    , final String description
                                    , final String priority ) {

        final ProjectCommandApplication projectCommandApplication = new ProjectCommandApplication( new ProjectFactory( new ProjectRepository()
                                                                                                                     , new UserRepository() ) );

            projectCommandApplication.createProject( new ProjectCommandDto( null
                                                                          , name
                                                                          , description
                                                                          , priority ) );
    }
}
