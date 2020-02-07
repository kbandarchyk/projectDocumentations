import { LightningElement } from 'lwc';
import { api, track, wire } from 'lwc';
import { refreshApex } from '@salesforce/apex';
import fetchById from '@salesforce/apex/UseCaseQueryController.fetchById';
import { TreeItemEnum } from 'c/utils';

export default class UseCaseDescriptionFrame extends LightningElement {

    @api useCaseId;
    @track useCase;

    wiredUseCase;

    @wire(fetchById, { useCaseId: '$useCaseId' } )
    fetchingUseCase(result) {

        this.wiredUseCase = result;

        if (result.data) {
            this.useCase = result.data;
            this.error = undefined;
        }
        else if (result.error) {
            this.useCase = undefined;
            this.error = result.error;
        }
    }

    ////////////////
    /// Get functions
    ////////////////


    @api
    refreshUseCase() {
        return refreshApex(this.wiredUseCase);
    }

    get isComponentDataLoaded() {
        return this.useCase;
    }

    get constructDescriptionHeader() {
        return `${TreeItemEnum.USECASE.value}: ${this.useCase.name} [ Version:${this.useCase.version} ]`;
    }

}