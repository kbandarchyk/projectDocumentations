import { LightningElement } from 'lwc';
import { wire,track } from 'lwc';
import { getPicklistValues } from 'lightning/uiObjectInfoApi';
import { getObjectInfo } from 'lightning/uiObjectInfoApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent'

import createProject from '@salesforce/apex/ProjectCommandController.createProject';
import { isBlankString } from 'c/utils';
import Project__c from '@salesforce/schema/Project__c';
import Priority__c from '@salesforce/schema/Project__c.Priority__c';


export default class CreatingProjectModalBox extends LightningElement {

    @track isSaveButtonDisabled = true;
    @track priorityPicklistValues;
    @track project = { 
                       name: null,
                       priority: null,
                       description: null
                     };
                     
    @wire(getObjectInfo, { objectApiName: Project__c })
    projectObjectInfo;
    
    @wire(getPicklistValues, { recordTypeId: '$projectObjectInfo.data.defaultRecordTypeId', fieldApiName: Priority__c})
    fetchingPriorityPicklist( result ){
        if( result.data ){
            this.priorityPicklistValues = result.data.values;
            this.error = undefined;
        } else if( result.error ){
            this.priorityPicklistValues = undefined;
            this.error = result.error;
        }
    }


    //////////////////
    /// Event handlers
    //////////////////       

    projectNameChangeHandler( event ) {
        this.project.name = event.target.value;
        this.isSaveButtonDisabled = this.calculateSaveButtonVisibility();
    }

    projectPriorityChangeHandler( event ) {
        this.project.priority = event.target.value;
        this.isSaveButtonDisabled = this.calculateSaveButtonVisibility();
    }

    projectDescriptionChangeHandler( event ){
        this.project.description = event.target.value;
        this.isSaveButtonDisabled = this.calculateSaveButtonVisibility();
    }

    closeButtonHandler() {

        this.project.name = null;
        this.project.priority = null;
        this.project.description = null;

        this.dispatchEvent( new CustomEvent( 'closecreatingproject' ) );
    }

    saveButtonHandler() {

        createProject( { 
                        name: this.project.name,
                        priority : this.project.priority,
                        description : this.project.description
                       } )
        .then( () => {
            this.dispatchEvent( new CustomEvent( 'refreshprojectstree', { bubbles: true, composed: true } ) ); 
            this.dispatchEvent( new CustomEvent( 'closecreatingproject' ) );
            this.dispatchEvent( new ShowToastEvent( {
                                                        "title" : "Success!",
                                                        "message" : "Project saved successfully",
                                                        "variant" : "success"
                                                    } ) );

        })
        .catch( ( error ) => {
            this.dispatchEvent( new ShowToastEvent( {
                                                        "title" : "Error!",
                                                        "message" : `Project cant be saved. Error: ${error.message}`,
                                                        "variant" : "error"
                                                    } ) );
        });
                    
    }

    ///////////////
    /// Utils
    ///////////////

    calculateSaveButtonVisibility() {

        var isProjectNameBlank = isBlankString( this.project.name );
        var isPriorityBlank = isBlankString( this.project.priority );

        return isProjectNameBlank || isPriorityBlank;
    }

    ////////////////
    /// Get methods
    ////////////////

    get isComponentDataLoaded() {
        return this.priorityPicklistValues;
    }

 
}