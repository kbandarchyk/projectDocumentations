import { LightningElement } from 'lwc';
import { api } from 'lwc';
import { TreeItemEnum } from 'c/utils'

export default class AttributesFrame extends LightningElement {

    @api selectedItem;

    ////////////////
    /// Get functions
    ////////////////

    get isProjectTypeItem() {
        return this.selectedItem.type === TreeItemEnum.PROJECT.value;
    }

    get isUseCaseTypeItem() {
        return this.selectedItem.type === TreeItemEnum.USECASE.value;
    }
}