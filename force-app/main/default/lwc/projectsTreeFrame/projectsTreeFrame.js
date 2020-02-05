/* eslint-disable no-console */
import { LightningElement, track } from 'lwc';
import { api, wire } from 'lwc';

import { TreeItemEnum } from 'c/utils';
import fetchAll from '@salesforce/apex/ProjectQueryController.fetchAll';

export default class ProjectTreeFrame extends LightningElement {

    @track projects;
    @track projectsTreeItems;
    @track possiblySelectedItems;
    @api selectedItem;

    @wire(fetchAll)
    fetchingProjects({data, error}){

        if(data){
            this.projects = data;
            this.projectsTreeItems = this.constructProjectsTreeItems();
            this.possiblySelectedItems = this.constructPossiblySelectedItems();
            this.error = undefined;
        }
        else if (error) {
            this.error = error;
            this.projects = undefined;
            this.projectsTreeItems = undefined;
            this.possiblySelectedItems = undefined;
        }
    }

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
                                                            type: TreeItemEnum.PROJECT.value,
                                                            name: project.name,
                                                            description: project.description,      
                                                            status: project.status,
                                                            version: project.version,
                                                            priority: project.priority,
                                                            author: Object.assign({}, project.author )
                                                           } ) );

        var useCaseItems = this.projects.flatMap( project => project.useCases.map( useCase => ( {
                                                                                                 id: useCase.id,
                                                                                                 type: TreeItemEnum.USECASE.value,
                                                                                                 name: useCase.name,
                                                                                                 useCaseNumber: useCase.useCaseNumber,
                                                                                                 description: useCase.description,
                                                                                                 version: useCase.version,
                                                                                                 priority: useCase.priority,
                                                                                                 projectId: useCase.projectId    
                                                                                                } ) ) );

        var resultItems = [];
        
        return resultItems.concat( projectItems )
                          .concat( useCaseItems );                                                                                       

    }

    selectItemHandler( event ) {

        var selectedItemId = event.detail.name;
        this.selectedItem = this.possiblySelectedItems.find( item => item.id === selectedItemId );

        this.dispatchEvent( new CustomEvent( 'selecteditem', { detail: this.selectedItem } ) );
    }
}