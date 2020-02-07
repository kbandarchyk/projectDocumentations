public with sharing class UseCaseApplication {

    private UseCaseFactory useCaseFactory;

    public UseCaseApplication( final UseCaseFactory useCaseFactory ) {
        this.useCaseFactory = useCaseFactory;
    }

    public void createUseCase( final UseCaseCommandDto useCaseCommandDto ){
        useCaseFactory.create( useCaseFactory.constructNew( useCaseCommandDto ) );
    }
}
