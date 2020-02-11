import { LightningElement } from 'lwc';
import { track } from 'lwc';

export default class RootFrame extends LightningElement {

    @track selectedItem;

    //////////////////
    /// Event handlers
    //////////////////       

    selectItemHandler( event ){

        if( event.detail !== undefined ) {
            this.selectedItem = event.detail;
        }
    }
    
    refreshProjectsTreeHandler() {
       this.template.querySelector('c-projects-tree-frame').refreshProjectsTree();
    }

}