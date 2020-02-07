import { LightningElement } from 'lwc';
import { api } from 'lwc';
import { TreeItemEnum } from 'c/utils'

export default class AttributesBodyFrame extends LightningElement {

    @api selectedItem;
    

    ////////////////
    /// Get methods
    ////////////////

    get isProjectTypeItem() {
        return this.selectedItem.type === TreeItemEnum.PROJECT.value;
    }

    get isUseCaseTypeItem() {
        return this.selectedItem.type === TreeItemEnum.USECASE.value;
    }

}