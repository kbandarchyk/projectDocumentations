public with sharing class ProjectApplication {

    private final ProjectFactory projectFactory;

    public ProjectApplication( final ProjectFactory projectFactory ) {
        this.projectFactory = projectFactory;
    }

    public void createProject( final ProjectCommandDto projectCommandDto ){
        projectFactory.create( projectFactory.constructNew( projectCommandDto ) );
    }
}
