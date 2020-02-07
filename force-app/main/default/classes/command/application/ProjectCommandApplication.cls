public with sharing class ProjectCommandApplication {

    private final ProjectFactory projectFactory;

    public ProjectCommandApplication( final ProjectFactory projectFactory ) {
        this.projectFactory = projectFactory;
    }

    public void createProject( final ProjectCommandDto projectCommandDto ){
        projectFactory.create( projectFactory.constructNew( projectCommandDto ) );
    }
}
