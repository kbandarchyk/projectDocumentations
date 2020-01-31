public with sharing class ProjectQueryController {

    private final ProjectQueryService projectQueryService;

    public ProjectQueryController( final ProjectQueryService projectQueryService ) {
        this.projectQueryService = projectQueryService;
    }

    public List<ProjectQueryDto> fetchAll(){
        return projectQueryService.fetchAll();
    }
}
