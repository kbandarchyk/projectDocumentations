import { LightningElement } from 'lwc';
import { wire,track } from 'lwc';
import { getPicklistValues } from 'lightning/uiObjectInfoApi';
import { getObjectInfo } from 'lightning/uiObjectInfoApi';
//import { ShowToastEvent } from 'lightning/platformShowToastEvent'

import fetchAll from '@salesforce/apex/FlatProjectQueryController.fetchAll';
//import createUseCase from '@salesforce/apex/UseCaseCommandController.createUseCase';
import { isBlankString, isEmptyNumber } from 'c/utils';
import UseCase__c from '@salesforce/schema/UseCase__c';
import Priority__c from '@salesforce/schema/UseCase__c.Priority__c';


export default class CreatingUseCaseModalBox extends LightningElement {

    @wire(getObjectInfo, { objectApiName: UseCase__c })
    useCaseObjectInfo;
    
    @wire(getPicklistValues, { recordTypeId: '$useCaseObjectInfo.data.defaultRecordTypeId', fieldApiName: Priority__c})
    fetchingPriorityPicklist( result ){

        if( result.data ){
            this.priorityPicklistValues = result.data.values;
            this.error = undefined;
            
        }
        else if( result.error ){
            this.priorityPicklistValues = undefined;
            this.error = result.error;
        }
    }

    @wire(fetchAll)
    fetchingFlatProjectPicklist( result ){

        if( result.data ){
            
            this.projectPicklistValues = result.data.map( project => ( {
                                                                        label : project.name,
                                                                        value : project.id
                                                                       } ) );
            this.error = undefined;

        }
        else if (result.error) {
            this.projectPicklistValue = undefined;
            this.error = result.error;
        }
    }

    @track projectPicklistValues;
    @track priorityPicklistValues;
    @track isSaveButtonDisabled = true;
    @track useCase = { 
                       name: null,
                       priority: null,
                       useCaseNumber: null,
                       projectId: null
                     };


    //////////////////
    /// Event handlers
    //////////////////                 
    
    useCaseProjectIdChangeHandler( event ) {
        this.useCase.projectId = event.target.value;
        this.isSaveButtonDisabled = this.calculateSaveButtonVisibility();
    }
    
    useCaseNumberChangeHandler( event ) {
        this.useCase.useCaseNumber = event.target.value;
        this.isSaveButtonDisabled = this.calculateSaveButtonVisibility();
    }

    useCaseNameChangeHandler( event ) {
        this.useCase.name = event.target.value;
        this.isSaveButtonDisabled = this.calculateSaveButtonVisibility();
    }

    useCasePriorityChangeHandler( event ) {
        this.useCase.priority = event.target.value;
        this.isSaveButtonDisabled = this.calculateSaveButtonVisibility();
    }

    closeButtonHandler() {

        this.useCase.name = null;
        this.useCase.priority = null;
        this.useCase.useCaseNumber = null;
        this.useCase.projectId = null;

        this.dispatchEvent( new CustomEvent( 'closecreatingusecase' ) );
    }

    saveButtonHandler() {

     /*   createUseCase( { 
                        name: this.useCase.name,
                        priority: this.useCase.priority,
                        useCaseNumber: this.useCase.useCaseNumber,
                        projectId: this.useCase.projectId
                       } )
        .then( () => {
            this.dispatchEvent( new CustomEvent( 'refreshprojectstree', { bubbles: true, composed: true } ) ); 
            this.dispatchEvent( new CustomEvent( 'closecreatingusecase' ) );
            this.dispatchEvent( new ShowToastEvent( {
                                                        "title" : "Success!",
                                                        "message" : "UseCase saved successfully",
                                                        "variant" : "success"
                                                    } ) );

        })
        .catch( ( error ) => {
            this.dispatchEvent( new ShowToastEvent( {
                                                        "title" : "Error!",
                                                        "message" : `UseCase cant be saved. Error: ${error.message}`,
                                                        "variant" : "error"
                                                    } ) );
        }); */
                    
    }

    ///////////////
    /// Utils
    ///////////////

    calculateSaveButtonVisibility() {

        var isUseCaseNameBlank = isBlankString( this.useCase.name );
        var isPriorityBlank = isBlankString( this.useCase.priority );
        var isUseCaseNumberInvalid = isEmptyNumber( this.useCase.useCaseNumber ) || this.useCase.useCaseNumber < 1
        var isProjectId = isBlankString( this.useCase.projectId );

        return isUseCaseNameBlank || isPriorityBlank || isUseCaseNumberInvalid || isProjectId;
    }


    ////////////////
    /// Get methods
    ////////////////

    get isComponentDataLoaded() {
        return this.projectPicklistValues && this.priorityPicklistValues;
    }

    
}