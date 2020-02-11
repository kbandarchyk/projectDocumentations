import { LightningElement } from 'lwc';
import { api } from 'lwc';
import { loadScript } from 'lightning/platformResourceLoader';
import MARKED_JS from '@salesforce/resourceUrl/marked';
import { isBlankString, EMPTY_STRING } from 'c/utils';

export default class MarkdownInterpreter extends LightningElement {

    isRendered = false;
    _sourceText;

    @api get sourceText() {
        return this._sourceText;
    }

    set sourceText( value ) {
        this._sourceText = value;

        if( this.isRendered ){
            this.renderMarkdown();
        }
    }

    renderedCallback() {

        if( this.isRendered ){
            return;
        }

        this.isRendered = true;

        loadScript( this, MARKED_JS )
            .then( () => { this.renderMarkdown() } );
    }

    renderMarkdown() {
        var sourceText = isBlankString( this.sourceText ) ? EMPTY_STRING : this.sourceText; 

        var modifiedSourceText = sourceText.replace(/&gt;+/g, '>');

        this.template.querySelector('div').innerHTML = marked( modifiedSourceText );
    }

}