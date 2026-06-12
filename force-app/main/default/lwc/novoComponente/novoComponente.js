import { LightningElement, track, wire } from 'lwc';
import startRequest from '@salesforce/apexContinuation/SampleContinuationClass.startRequest';
import { CurrentPageReference } from 'lightning/navigation';

//cabeçalho do lightning-datatable, fixado porque o retorno é do XML, fieldname tem que bater com a tag XML.
const columns = [
    {label: 'Id do cliente', fieldName: 'id', type: 'text'},
    {label: 'E-mail', fieldName: 'email', type: 'email'},
    {label: 'Primeiro Nome', fieldName: 'first_name', type: 'text'},
    {label: 'Último nome', fieldName: 'last_name', type: 'text'},
    {label: 'Avatar', fieldName: 'avatar', type: 'url'},
    ];

export default class ContinuationComponent extends LightningElement {
    
    //variável a ser recuperada em tela e passada em lista
    @track data = {};
    @track Id;
    @track recordId;

    currentPageReference = null; 

    @wire(CurrentPageReference)
    getStateParameters(currentPageReference) {
        if (currentPageReference) {
            var urlJson = currentPageReference;
            var recordIdJson = urlJson.state.fragment;
            this.recordId = JSON.stringify(recordIdJson); 
        }
    }

    // Using wire service (verificar necessidade)
    //@wire(startRequest)
    //wiredContinuation;
    columns = columns;
    
    // Imperative Call
    callContinuation() {
        startRequest(this.recordId)
            .then(result => {
                //Pega o retorno do JSON, converte em Objeto, separa a tag (data nesse JSON) e retorna separado.
                var teste = JSON.parse(result);
                var retorno = teste.data;
                this.data = retorno;
            })
            .catch(error => {
                //Caso haja erro joga no valor.
                this.imperativeContinuation = error;
            }
        );
    }
}