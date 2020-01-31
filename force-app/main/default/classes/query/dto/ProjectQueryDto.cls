public with sharing class ProjectQueryDto {

    private final String id;
    private final String name;
    private final String description;
    private final String status;
    private final Integer version;
    private final String priority;
    private final UserQueryDto author;
    private final List<UseCaseQueryDto> useCases;

    public ProjectQueryDto( final String id
                          , final String name
                          , final String description
                          , final String status
                          , final Integer version
                          , final String priority
                          , final UserQueryDto author
                          , final List<UseCaseQueryDto> useCases ) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.status = status;
        this.version = version;
        this.priority = priority;
        this.author = author;
        this.useCases = useCases;                      
    }

    public String getId(){
        return this.id;
    }

    public String getName(){
        return this.name;
    }

    public String getDescription(){
        return this.description;
    }

    public String getStatus(){
        return this.status;
    }

    public Integer getVersion(){
        return this.version;
    }

    public String getPriority(){
        return this.priority;
    }

    public UserQueryDto getAuthor(){
        return this.author;
    } 

    public List<UseCaseQueryDto> getUseCases(){
        return this.useCases;
    }
}
