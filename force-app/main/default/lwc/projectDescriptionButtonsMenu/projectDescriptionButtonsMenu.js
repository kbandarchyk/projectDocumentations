import { LightningElement } from 'lwc';
import { api, track } from 'lwc';
import { ProjectStatusEnum } from 'c/utils';

export default class ProjectDescriptionButtonsMenu extends LightningElement {

    @api project;
    @track isEditModeActive = false;

    ////////////////
    /// Get functions
    ////////////////

    get isEditModeButtonDisabled() {
        return !this.isProjectInDevelopment();
    }
    ///////////////
    /// Utils
    ///////////////

    isProjectInDevelopment() {
        return this.project.status === ProjectStatusEnum.IN_DEVELOPMENT.value;
    }

    //////////////////
    /// Event handlers
    //////////////////  

    editModeHandlerClick() {
        this.isViewModeActive = false;
        this.isEditModeActive = true;
    }

    closeEditModeHandlerClick() {
        this.isViewModeActive = false;
        this.isEditModeActive = false;
    }

}