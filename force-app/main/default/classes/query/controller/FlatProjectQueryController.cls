public with sharing class FlatProjectQueryController {

    @AuraEnabled( cacheable=true )
    public static List<FlatProjectQueryDto> fetchAll(){

        final FlatProjectQueryService flatProjectQueryService = new FlatProjectQueryService( new ProjectRepository() );

        return flatProjectQueryService.fetchAll();
    }
}
