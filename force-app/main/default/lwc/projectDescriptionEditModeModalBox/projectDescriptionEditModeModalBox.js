import { LightningElement } from 'lwc';
import { api, track } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

import editProjectDescription from '@salesforce/apex/ProjectCommandController.editProjectDescription';

export default class ProjectDescriptionEditModeModalBox extends LightningElement {

    @api project;
    @track changedProject;

    connectedCallback() {

        this.changedProject = { 
                                projectId: this.project.id,
                                description: this.project.description
                              };
    }

    //////////////////
    /// Event handlers
    //////////////////      

    closeButtonHandler() {

        this.changedProject = {
                                projectId: null,
                                description: null    
                              };

        this.dispatchEvent(new CustomEvent('closeprojecteditmode'));
    }

    saveButtonHandler() {
        editProjectDescription( { 
            projectId: this.changedProject.projectId,
            description : this.changedProject.description  
           } )
        .then( () => {
            this.dispatchEvent( new CustomEvent( 'refreshprojectdescription', { bubbles: true, composed: true } ) ); 
            this.dispatchEvent( new CustomEvent( 'closeprojecteditmode' ) );
            this.dispatchEvent( new ShowToastEvent( {
                                                     "title" : "Success!",
                                                     "message" : "Project description was changed successfully",
                                                     "variant" : "success"
                                                    } ) );

        })
        .catch( ( error ) => {
            this.dispatchEvent( new ShowToastEvent( {
                                                     "title" : "Error!",
                                                     "message" : `Project description cant be changed. Error: ${error.message}`,
                                                     "variant" : "error"
                                                    } ) );
        });
    }


    projectDescriptionChangeHandler( event ){
        this.changedProject.description = event.target.value;
    }
}