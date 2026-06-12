import { LightningElement } from 'lwc';

export default class Selector extends LightningElement {
    selectedHeroId;
    
    handleHeroSelected(evt) {
        this.selectedHerotId = evt.detail;
    }
}