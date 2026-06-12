import { LightningElement, track } from 'lwc';
import buscaChar from '@salesforce/apex/heroesSelector.persongens';

// const columns =  [
//     { label: 'Id', fieldName: 'Id', type: 'text' },
//     { label: 'Nome', fieldName: 'Name', type: 'text' },
//     { label: 'Descrição', fieldName: 'Descricao__c', type: 'text' },
// ];

export default class HeroesList extends LightningElement {
    @track personagens;
    @track error;
    

    connectedCallback(){
        buscaChar()
            .then(result => {               
                this.personagens = result;
            })
            .catch(error => {
                this.error = error;
            }); 
        }
    
    handleTileClick(evt) {
        // This component wants to emit a productselected event to its parent
        const event = new CustomEvent('heroselected', {
            detail: evt.detail
        });
        // Fire the event from c-list
        this.dispatchEvent(event);
    }
}