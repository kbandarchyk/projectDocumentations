public with sharing class UseCaseQueryController {

    @AuraEnabled( cacheable=true )
    public static UseCaseQueryDto fetchById( final String useCaseId ){

        final UseCaseQueryService useCaseQueryService = new UseCaseQueryService( new UseCaseRepository() );

        return useCaseQueryService.fetchBy( useCaseId );
    }
}
