import { LightningElement } from 'lwc';
import { wire,track } from 'lwc';
import { getPicklistValues } from 'lightning/uiObjectInfoApi';
import { getObjectInfo } from 'lightning/uiObjectInfoApi';

import createProject from '@salesforce/apex/ProjectCommandController.createProject';

import Project__c from '@salesforce/schema/Project__c';
import Priority__c from '@salesforce/schema/Project__c.Priority__c';

export default class CreatingProjectModalBox extends LightningElement {

    @wire(getObjectInfo, { objectApiName: Project__c })
    priorityObjectInfo;
    
    @wire(getPicklistValues, { recordTypeId: '$priorityObjectInfo.data.defaultRecordTypeId', fieldApiName: Priority__c})
    priorityPicklistValues;

    @track project = { 
                       name: null,
                       priority: null,
                       description: null
                     };

    projectNameChangeHandler( event ) {
        this.project.name = event.target.value;
    }

    projectPriorityChangeHandler( event ) {
        this.project.priority = event.target.value;
    }

    projectDescriptionChangeHandler( event ){
        this.project.description = event.target.value;
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
            // eslint-disable-next-line no-console
            console.log('Successfully');
            this.dispatchEvent( new CustomEvent( 'closecreatingproject' ) );
        })
        .catch( ( error ) => {
            // eslint-disable-next-line no-console
            console.log(`Error received: code: ${error.errorCode}, message:${error.body.message}`);
        });
                    
    }

 
}