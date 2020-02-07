public with sharing class ProjectOfUseCase {
    
    private final String id;
    private final String name;
    private final String description;
    private final ProjectStatus status;
    private final Integer version;
    private final Priority priority;

    public ProjectOfUseCase( final String id
                           , final String name
                           , final String description
                           , final ProjectStatus status
                           , final Integer version
                           , final Priority priority ) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.status = status;
        this.version = version;
        this.priority = priority;        

        init();
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

    }

}
