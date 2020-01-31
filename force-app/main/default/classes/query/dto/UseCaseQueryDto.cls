public with sharing class UseCaseQueryDto {

    private final String id;
    private final String name;
    private final Integer useCaseNumber;
    private final String description;
    private final Integer version;
    private final String priority;
    private final String projectId;

    public UseCaseQueryDto( final String id
                          , final String name
                          , final Integer useCaseNumber
                          , final String description
                          , final Integer version
                          , final String priority
                          , final String projectId ) {
        this.id = id;
        this.name = name;
        this.useCaseNumber = useCaseNumber;
        this.description = description;
        this.version = version;
        this.priority = priority;
        this.projectId = projectId;
    }

    public String getId() {
        return this.id;
    }

    public String getName() {
        return this.name;
    }

    public Integer getUseCaseNumber() {
        return this.useCaseNumber;
    }

    public String getDescription() {
        return this.description;
    }

    public Integer getVersion() {
        return this.version;
    }

    public String getProjectId(){
        return this.projectId;
    }
    
}
