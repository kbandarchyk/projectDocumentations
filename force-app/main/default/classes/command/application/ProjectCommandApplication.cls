public with sharing class ProjectCommandApplication {

    private final ProjectFactory projectFactory;

    public ProjectCommandApplication( final ProjectFactory projectFactory ) {
        this.projectFactory = projectFactory;
    }

    public void createProject( final ProjectCommandDto projectCommandDto ){
        projectFactory.creating( projectFactory.constructNew( projectCommandDto ) );
    }

    public void transferToPublishProject( final String projectId ){

        final Project modifiedProject = projectFactory.fetchBy( projectId )
                                                      .transferToPublish();

        projectFactory.updating( modifiedProject );
    }

    public void transferToInDevelopmentProject( final String projectId ){

        final Project modifiedProject = projectFactory.fetchBy( projectId )
                                                      .transferToInDevelopment();

        projectFactory.updating( modifiedProject );
    }

    public void transferToDeletedProject( final String projectId ){

        final Project modifiedProject = projectFactory.fetchBy( projectId )
                                                      .transferToDeleted();

        projectFactory.updating( modifiedProject );
    }

    public void editProjectDescription( final String projectId
                                      , final String description ) {
        
        final Project modifiedProject = projectFactory.fetchBy( projectId )
                                                      .editDescription( description );
        
        projectFactory.updating( modifiedProject );                                

    }
}
