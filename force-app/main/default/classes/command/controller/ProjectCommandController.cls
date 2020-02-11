public with sharing class ProjectCommandController {

    @AuraEnabled
    public static void createProject( final String name
                                    , final String description
                                    , final String priority ) {

        final ProjectCommandApplication projectCommandApplication = new ProjectCommandApplication( new ProjectFactory( new ProjectRepository() ) );

            projectCommandApplication.createProject( new ProjectCommandDto( null
                                                                          , name
                                                                          , description
                                                                          , priority ) );
    }

    @AuraEnabled
    public static void transferToPublishProject( final String projectId ) {

        final ProjectCommandApplication projectCommandApplication = new ProjectCommandApplication( new ProjectFactory( new ProjectRepository() ) );

            projectCommandApplication.transferToPublishProject( projectId );
    }

    @AuraEnabled
    public static void transferToInDevelopmentProject( final String projectId ) {

        final ProjectCommandApplication projectCommandApplication = new ProjectCommandApplication( new ProjectFactory( new ProjectRepository() ) );

            projectCommandApplication.transferToInDevelopmentProject( projectId );
    }

    @AuraEnabled
    public static void transferToDeletedProject( final String projectId ) {

        final ProjectCommandApplication projectCommandApplication = new ProjectCommandApplication( new ProjectFactory( new ProjectRepository() ) );

        projectCommandApplication.transferToDeletedProject( projectId );
    }

    @AuraEnabled
    public static void editProjectDescription( final String projectId
                                             , final String description ) {

        final ProjectCommandApplication projectCommandApplication = new ProjectCommandApplication( new ProjectFactory( new ProjectRepository() ) );

        projectCommandApplication.editProjectDescription( projectId, description );
    }
}
