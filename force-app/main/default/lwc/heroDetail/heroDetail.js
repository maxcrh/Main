import { LightningElement, api, track } from 'lwc';
import buscaChar from '@salesforce/apex/heroesSelector.persongens';

export default class HeroDetail extends LightningElement {
    @track personagens;
    @track personagemEscolhido;
    @track error;

    connectedCallback(){
        buscaChar()
            .then(result => {
                console.log('personagens Detail= ', JSON.stringify(result));
                this.personagens = result;
            })
            .catch(error => {
                this.error = error;
            }); 
        }

    hero = false;

    _heroId = undefined;

    set heroId(value) {
        this._heroId = value;

        for(var a in this.personagens){
            if(this.personagens[a].Id === value){
                this.hero = true;
                this.personagemEscolhido = this.personagens[a];
            }
        }
        //this.hero = this.personagens.find(personagem => personagem.Id === value);
        
    }

    // get para pegar heroId
    @api get heroId(){
        return this._heroId;
    }

}