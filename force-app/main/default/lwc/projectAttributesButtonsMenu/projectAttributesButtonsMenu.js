import { LightningElement } from 'lwc';
import { api, track } from 'lwc';
import { ProjectStatusEnum } from 'c/utils';

export default class ProjectAttributesButtonsMenu extends LightningElement {

    @api project;
    @track isPublicationProjectModalBoxActive = false;
    @track isInDevelopmentProjectModalBoxActive = false;
    @track isDeletingProjectModalBoxActive = false;

    ////////////////
    /// Get functions
    ////////////////

    get isPublishButtonDisabled() {
        return this.isProjectPublished() || this.isProjectDeleted();
    }

    get isInDevelopmentButtonDisabled() {
        return this.isProjectInDevelopment() || this.isProjectDeleted();
    }

    get isDeletedButtonDisabled() {
        return this.isProjectDeleted();
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

    isProjectDeleted() {
        return this.project.status === ProjectStatusEnum.DELETED.value;
    }

    //////////////////
    /// Event handlers
    //////////////////  

    publishProjectHandlerClick() {
        this.isPublicationProjectModalBoxActive = true;
        this.isInDevelopmentProjectModalBoxActive = false;
        this.isDeletingProjectModalBoxActive = false;
    }

    inDevelopmentProjectHandlerClick() {
        this.isPublicationProjectModalBoxActive = false;
        this.isInDevelopmentProjectModalBoxActive = true;
        this.isDeletingProjectModalBoxActive = false;
    }

    deleteProjectHandlerClick() {
        this.isPublicationProjectModalBoxActive = false;
        this.isInDevelopmentProjectModalBoxActive = false;
        this.isDeletingProjectModalBoxActive = true;
    }

    closePublicationProjectHandlerClick() {
        this.isPublicationProjectModalBoxActive = false;
        this.isInDevelopmentProjectModalBoxActive = false;
        this.isDeletingProjectModalBoxActive = false;
    }

    closeInDevelopmentProjectHandlerClick() {
        this.isPublicationProjectModalBoxActive = false;
        this.isInDevelopmentProjectModalBoxActive = false;
        this.isDeletingProjectModalBoxActive = false;
    }

    closeDeletionProjectHandlerClick() {
        this.isPublicationProjectModalBoxActive = false;
        this.isInDevelopmentProjectModalBoxActive = false;
        this.isDeletingProjectModalBoxActive = false;
    }
    
}