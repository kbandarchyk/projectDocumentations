public with sharing class UseCaseCommandApplication {

    private UseCaseFactory useCaseFactory;

    public UseCaseCommandApplication( final UseCaseFactory useCaseFactory ) {
        this.useCaseFactory = useCaseFactory;
    }

    public void createUseCase( final UseCaseCommandDto useCaseCommandDto ){
        useCaseFactory.creating( useCaseFactory.constructNew( useCaseCommandDto ) );
    }
}
