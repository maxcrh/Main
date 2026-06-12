import { LightningElement } from 'lwc';

export default class App extends LightningElement {
    name='Bike Max';
    description='A melhor do mundo';
    category='Montain';
    material='Steel';
    price='R$ 999.00';
    pictureURL='https://s3-us-west-1.amazonaws.com/sfdc-demo/ebikes/electrax4.jpg';
    ready=false;

    connectedCallback(){
        setTimeout(() => {
            this.ready = true;
        }, 3000);
    }
}