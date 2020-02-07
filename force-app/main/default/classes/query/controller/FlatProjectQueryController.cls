public with sharing class FlatProjectQueryController {

    @AuraEnabled( cacheable=true )
    public static List<FlatProjectQueryDto> fetchAll(){

        final FlatProjectQueryService flatProjectQueryService = new FlatProjectQueryService( new ProjectRepository() );

        return flatProjectQueryService.fetchAll();
    }

    @AuraEnabled( cacheable=true )
    public static FlatProjectQueryDto fetchById( final String projectId ){

        final FlatProjectQueryService flatProjectQueryService = new FlatProjectQueryService( new ProjectRepository() );

        return flatProjectQueryService.fetchBy( projectId );
    }
}
