public with sharing class Project {

    private final String id;
    private final String name;
    private final String description;
    private final ProjectStatus status;
    private final Integer version;
    private final Priority priority;
    private final UserInformation author;

    public Project( final String id
                  , final String name
                  , final String description
                  , final ProjectStatus status
                  , final Integer version
                  , final Priority priority
                  , final UserInformation author ) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.status = status;
        this.version = version;
        this.priority = priority;
        this.author = author;              

        init();
    }

    public Project transferToPublish(){

        if( status == ProjectStatus.PUBLISHED ){
            throw new InvalidStatusChangeException( 'Project is already in PUBLISHED status' );
        }

        return new Project( id, name, description, ProjectStatus.PUBLISHED, version, priority, author );
    }

    public Project transferToInDevelopment() {

        if( status == ProjectStatus.IN_DEVELOPMENT ){
            throw new InvalidStatusChangeException( 'Project is already in IN_DEVELOPMENT status' );
        }

        return new Project( id, name, description, ProjectStatus.IN_DEVELOPMENT, version, priority, author );
    }

    public String getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getDescription() {
        return description;
    }

    public ProjectStatus getStatus() {
        return status;
    }

    public Integer getVersion() {
        return version;
    }

    public Priority getPriority() {
        return priority;
    }

    public UserInformation getAuthor() {
        return author;
    }

    
    private void init() {

        if( name == null ) {
            throw new CreateInvalidObjectException( 'Project name cant be empty' );
        }

        if( status == null ) {
            throw new CreateInvalidObjectException( 'Project status cant be empty' );
        }

        if( version == null ) {
            throw new CreateInvalidObjectException( 'Project version cant be empty' );
        }

        if( priority == null ) {
            throw new CreateInvalidObjectException( 'Project priority cant be empty' );
        }

        if( author == null ) {
            throw new CreateInvalidObjectException( 'Project author cant be empty' );
        }
    }

}
