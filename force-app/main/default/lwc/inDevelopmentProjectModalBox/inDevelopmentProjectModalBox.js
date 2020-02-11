import { LightningElement } from 'lwc';
import { api } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent'
import transferToInDevelopmentProject from '@salesforce/apex/ProjectCommandController.transferToInDevelopmentProject';

export default class InDevelopmentProjectModalBox extends LightningElement {

    @api projectId;

    ///////////////////
    /// Event handlers
    ///////////////////

    rejectButtonHandler() {
        this.dispatchEvent( new CustomEvent( 'closeindevelopmentproject') );
    }

    acceptButtonHandler() {

        transferToInDevelopmentProject( { 
            projectId: this.projectId
           } )
        .then( () => {
            this.dispatchEvent( new CustomEvent( 'refreshprojectattributes', { bubbles: true, composed: true } ) ); 
            this.dispatchEvent( new CustomEvent( 'closeindevelopmentproject' ) );
            this.dispatchEvent( new ShowToastEvent( {
                                                     "title" : "Success!",
                                                     "message" : "Project transfered to In development successfully",
                                                     "variant" : "success"
                                                    } ) );

        })
        .catch( ( error ) => {
            this.dispatchEvent( new ShowToastEvent( {
                                                     "title" : "Error!",
                                                     "message" : `Project cant be transfered to In development. Error: ${error.message}`,
                                                     "variant" : "error"
                                                    } ) );
        });

    }
}