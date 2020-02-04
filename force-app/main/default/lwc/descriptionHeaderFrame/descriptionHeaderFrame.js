import { LightningElement } from 'lwc';
import { api } from 'lwc';
import { TreeItemEnum } from 'c/utils';

export default class DescriptionHeaderFrame extends LightningElement {

    @api selectedItem;
    
    get constructDescriptionHeader() {

        switch( this.selectedItem.type ) {
            case TreeItemEnum.PROJECT.value : 
                return `${TreeItemEnum.PROJECT.value}: ${this.selectedItem.name} [ Version:${this.selectedItem.version} ]`;
            case TreeItemEnum.USECASE.value :
                return `${TreeItemEnum.USECASE.value}: ${this.selectedItem.name} [ Version:${this.selectedItem.version} ]`;
            default: 
                return null;    
        }
    }

}