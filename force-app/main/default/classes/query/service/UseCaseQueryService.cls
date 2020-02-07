public with sharing class UseCaseQueryService {

    private UseCaseRepository useCaseRepository;

    public UseCaseQueryService( final UseCaseRepository useCaseRepository ) {
        this.useCaseRepository = useCaseRepository;
    }

    public List<UseCaseQueryDto> fetchListByProjectIds( final List<String> projectIds ){
        
        final List<UseCase__c> useCaseRepoDtos = useCaseRepository.fetchListByProjectIds( projectIds );

        final List<UseCaseQueryDto> resultList = new List<UseCaseQueryDto>();

        for( UseCase__c useCaseRepoDto : useCaseRepoDtos ){
            resultList.add( toUseCaseQueryDto( useCaseRepoDto ) );
        }
        
        return resultList;
    }


    ///////////////////
    /// Utils 
    //////////////////

    private UseCaseQueryDto toUseCaseQueryDto( final UseCase__c useCase ){
        return new UseCaseQueryDto( useCase.ID
                                  , useCase.Name
                                  , useCase.Number__c.intValue()
                                  , useCase.Description__c
                                  , useCase.Status__c
                                  , useCase.Version__c.intValue()
                                  , useCase.Priority__c
                                  , useCase.Project__r.Id );
    }
}
