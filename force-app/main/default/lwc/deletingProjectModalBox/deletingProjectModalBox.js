import { LightningElement } from 'lwc';
import { api } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent'
import transferToDeletedProject from '@salesforce/apex/ProjectCommandController.transferToDeletedProject';

export default class DeletingProjectModalBox extends LightningElement {

    @api projectId;

    ///////////////////
    /// Event handlers
    ///////////////////

    rejectButtonHandler() {
        this.dispatchEvent( new CustomEvent( 'closedeletingproject') );
    }

    acceptButtonHandler() {

        transferToDeletedProject( { 
            projectId: this.projectId
           } )
        .then( () => {
            this.dispatchEvent( new CustomEvent( 'refreshprojectstree', { bubbles: true, composed: true } ) ); 
            this.dispatchEvent( new CustomEvent( 'refreshprojectattributes', { bubbles: true, composed: true } ) ); 
            this.dispatchEvent( new CustomEvent( 'closedeletingproject' ) );
            this.dispatchEvent( new ShowToastEvent( {
                                                     "title" : "Success!",
                                                     "message" : "Project deleted successfully",
                                                     "variant" : "success"
                                                    } ) );

        })
        .catch( ( error ) => {
            this.dispatchEvent( new ShowToastEvent( {
                                                     "title" : "Error!",
                                                     "message" : `Project cant be deleted. Error: ${error.message}`,
                                                     "variant" : "error"
                                                    } ) );
        });

    }
}