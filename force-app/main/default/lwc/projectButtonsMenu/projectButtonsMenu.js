import { LightningElement } from 'lwc';
import { track } from 'lwc';

export default class ProjectButtonsMenu extends LightningElement {

    @track isCreatingProjectModalBoxActive = false;
    @track isCreatingUseCaseModalBoxActive = false;

    createProjectHandlerClick() {
        this.isCreatingProjectModalBoxActive = true;
        this.isCreatingUseCaseModalBoxActive = false;
    }

    createUseCaseHandlerClick() {
        this.isCreatingProjectModalBoxActive = false;
        this.isCreatingUseCaseModalBoxActive = true;
    }

    closeCreatingProjectHandlerClick() {
        this.isCreatingProjectModalBoxActive = false;
        this.isCreatingUseCaseModalBoxActive = false;
    }


}