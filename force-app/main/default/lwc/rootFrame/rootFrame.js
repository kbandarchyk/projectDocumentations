import { LightningElement } from 'lwc';
import { api,track } from 'lwc';

export default class RootFrame extends LightningElement {

    @api selectedItem;
    @track isItemSelected = false;

    //////////////////
    /// Event handlers
    //////////////////       

    selectItemHandler( event ){

        if( event.detail === undefined ) {
            this.isItemSelected = false;
        } else {
            this.selectedItem = event.detail;
            this.isItemSelected = true;
        }
    }
    
    refreshProjectsTreeHandler() {
       this.template.querySelector('c-projects-tree-frame').refreshProjectsTree();
    }

}
