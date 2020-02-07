/* eslint-disable no-console */
import { LightningElement, track } from 'lwc';
import { api, wire } from 'lwc';

import { refreshApex } from '@salesforce/apex';
import { TreeItemEnum } from 'c/utils';
import fetchAll from '@salesforce/apex/ProjectQueryController.fetchAll';

export default class ProjectTreeFrame extends LightningElement {

    @track projects;
    @track projectsTreeItems;
    @track possiblySelectedItems;
    @track selectedItem;

    wiredProjects;

    @wire(fetchAll)
    fetchingProjects( result ){

        this.wiredProjects = result;

        if( result.data ){
            this.projects = result.data;
            this.projectsTreeItems = this.constructProjectsTreeItems();
            this.possiblySelectedItems = this.constructPossiblySelectedItems();
            this.error = undefined;
        }
        else if (result.error) {
            this.projects = undefined;
            this.projectsTreeItems = undefined;
            this.possiblySelectedItems = undefined;
            this.error = result.error;
        }
    }

    ///////////////
    /// Utils
    ///////////////

    constructProjectsTreeItems() {
        
        return this.projects.map( project => ( { 
                                                label : project.name,
                                                name : project.id,
                                                items : [ 
                                                          { 
                                                            label : "UseCases",
                                                            name : "useCaseFolder", 
                                                            items : this.constructProjectTreeItems( project.useCases ) 
                                                          } 
                                                        ] 
                                               } ) );
    }

    constructProjectTreeItems( useCases ) {
        return useCases.map( useCase => ( { 
                                           label : `UC-${useCase.useCaseNumber}:${useCase.name}`,
                                           name  : useCase.id,
                                           items : [] 
                                          } ) );
    }

    constructPossiblySelectedItems() {

        var projectItems = this.projects.map( project => ( { 
                                                            id: project.id,
                                                            type: TreeItemEnum.PROJECT.value
                                                           } ) );

        var useCaseItems = this.projects.flatMap( project => project.useCases.map( useCase => ( {
                                                                                                 id: useCase.id,
                                                                                                 type: TreeItemEnum.USECASE.value
                                                                                                } ) ) );

        var resultItems = [];
        
        return resultItems.concat( projectItems )
                          .concat( useCaseItems );                                                                                       

    }

    @api
    refreshProjectsTree() {
        return refreshApex(this.wiredProjects);
    }

    get isComponentDataLoaded() {
        return this.projectsTreeItems;
    }

    //////////////////
    /// Event handlers
    //////////////////       

    selectItemHandler( event ) {

        var selectedItemId = event.detail.name;
        this.selectedItem = this.possiblySelectedItems.find( item => item.id === selectedItemId );

        this.dispatchEvent( new CustomEvent( 'selecteditem', { detail: this.selectedItem } ) );
    }


}