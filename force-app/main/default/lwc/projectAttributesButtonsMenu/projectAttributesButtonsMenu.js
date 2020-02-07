import { LightningElement } from 'lwc';
import { api, track } from 'lwc';
import { ProjectStatusEnum } from 'c/utils';

export default class ProjectAttributesButtonsMenu extends LightningElement {

    @api selectedItem;
    @track isPublicationProjectModalBoxActive = false;
    @track isDeletingProjectModalBoxActive = false;

    ////////////////
    /// Get methods
    ////////////////

    get isPublishButtonDisabled() {
        return this.isProjectPublished();
    }

    ///////////////
    /// Utils
    ///////////////

    isProjectInDevelopment() {
        return this.selectedItem.status === ProjectStatusEnum.IN_DEVELOPMENT.value;
    }

    isProjectPublished() {
        return this.selectedItem.status === ProjectStatusEnum.PUBLISHED.value;
    }

    //////////////////
    /// Event handlers
    //////////////////  

    publishProjectHandlerClick() {
        this.isPublicationProjectModalBoxActive = true;
        this.isDeletingProjectModalBoxActive = false;
    }

    deleteProjectHandlerClick() {
        this.isPublicationProjectModalBoxActive = false;
        this.isDeletingProjectModalBoxActive = true;
    }

    closePublicationProjectHandlerClick() {
        this.isPublicationProjectModalBoxActive = false;
        this.isDeletingProjectModalBoxActive = false;
    }

    closeDeletionProjectHandlerClick() {
        this.isPublicationProjectModalBoxActive = false;
        this.isDeletingProjectModalBoxActive = false;
    }
    
}