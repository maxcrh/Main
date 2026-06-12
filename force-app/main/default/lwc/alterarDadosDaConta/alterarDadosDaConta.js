import { LightningElement, api } from 'lwc';
import { showToastEvent } from 'lightning/platformShowToastEvent';

export default class AlterarDadosDaConta extends LightningElement {

    @api recordId;
    @api objectApiName;

    exibirErro(event){
        if(event.detail.detail != null){
            this.dispatchEvent(new showToastEvent({
                title: 'Ocorreu um erro',
                message: event.detail.detail,
                variant: 'error'
            }));
        }
    }
}