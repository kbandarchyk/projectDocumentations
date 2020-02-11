import { LightningElement } from 'lwc';
import { api, track, wire } from 'lwc';
import { TreeItemEnum } from 'c/utils';
import { refreshApex } from '@salesforce/apex';
import fetchById from '@salesforce/apex/FlatProjectQueryController.fetchById';

export default class ProjectDescriptionFrame extends LightningElement {

    @api projectId;
    @track project;

    wiredProject;

    @wire(fetchById, { projectId: '$projectId' } )
    fetchingProject( result ){

        this.wiredProject = result;

        if( result.data ){
            this.project = result.data;
            this.error = undefined;
        }
        else if (result.error) {
            this.project = undefined;
            this.error = result.error;
        }
    }

    ///////////////////
    /// Event handlers
    ///////////////////

    refreshProjectDescriptionHandler() {
        this.refreshProject();
    }

    ////////////////
    /// Get functions
    ////////////////

    @api
    refreshProject() {
        return refreshApex(this.wiredProject);
    }

    get isComponentDataLoaded() {
        return this.project;
    }

    get constructDescriptionHeader() {
        return `${TreeItemEnum.PROJECT.value}: ${this.project.name} [ Version:${this.project.version} ]`;
    }

}