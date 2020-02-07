import { LightningElement } from 'lwc';
import { api } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent'
import transferToPublishProject from '@salesforce/apex/ProjectCommandController.transferToPublishProject';

export default class PublicationProjectModalBox extends LightningElement {

    @api projectId;

    ///////////////////
    /// Event handlers
    ///////////////////

    rejectButtonHandler() {
        this.dispatchEvent( new CustomEvent( 'closepublicationproject') );
    }

    acceptButtonHandler() {

        transferToPublishProject( { 
            projectId: this.projectId
           } )
        .then( () => {
            this.dispatchEvent( new CustomEvent( 'refreshprojectstree', { bubbles: true, composed: true } ) ); 
            this.dispatchEvent( new CustomEvent( 'closepublicationproject' ) );
            this.dispatchEvent( new ShowToastEvent( {
                                                     "title" : "Success!",
                                                     "message" : "Project transfered to publication successfully",
                                                     "variant" : "success"
                                                    } ) );

        })
        .catch( ( error ) => {
            this.dispatchEvent( new ShowToastEvent( {
                                                     "title" : "Error!",
                                                     "message" : `Project cant be transfered to publication. Error: ${error.message}`,
                                                     "variant" : "error"
                                                    } ) );
        });

    }
}