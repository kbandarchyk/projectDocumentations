public with sharing class UseCase {

    private final String id;
    private final String name;
    private final Integer useCaseNumber;
    private final String description;
    private final UseCaseStatus status;
    private final Integer version;
    private final Priority priority;
    private final ProjectOfUseCase project;

    public UseCase( final String id
                  , final String name
                  , final Integer useCaseNumber
                  , final String description
                  , final UseCaseStatus status
                  , final Integer version
                  , final Priority priority
                  , final ProjectOfUseCase project ) {
        this.id = id;
        this.name = name;
        this.useCaseNumber = useCaseNumber;
        this.description = description;
        this.status = status;
        this.version = version;
        this.priority = priority;
        this.project = project;

        init();
    }

    public String getId(){
        return id;
    }

    public String getName(){
        return name;
    }

    public Integer getUseCaseNumber(){
        return useCaseNumber;
    }

    public String getDescription(){
        return description;
    }

    public UseCaseStatus getStatus(){
        return status;
    }

    public Integer getVersion(){
        return version;
    }

    public Priority getPriority(){
        return priority;
    }

    public ProjectOfUseCase getProjectOfUseCase(){
        return project;
    }

    private void init() {

        if( name == null ){
            throw new CreateInvalidObjectException('UseCase name cant be empty');
        }

        if( useCaseNumber == null ){
            throw new CreateInvalidObjectException('UseCase number cant be empty');
        }

        if( status == null ){
            throw new CreateInvalidObjectException('UseCase status cant be empty');
        }

        if( version == null ){
            throw new CreateInvalidObjectException('UseCase version cant be empty');
        }

        if( priority == null ){
            throw new CreateInvalidObjectException('UseCase priority cant be empty');
        }

        if( project == null ){
            throw new CreateInvalidObjectException('UseCase project cant be empty');
        }
    }
}
