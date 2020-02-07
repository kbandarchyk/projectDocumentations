import { LightningElement } from 'lwc';
import { api, track } from 'lwc';
import { ProjectStatusEnum } from 'c/utils';

export default class ProjectAttributesButtonsMenu extends LightningElement {

    @api project;
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
        return this.project.status === ProjectStatusEnum.IN_DEVELOPMENT.value;
    }

    isProjectPublished() {
        return this.project.status === ProjectStatusEnum.PUBLISHED.value;
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