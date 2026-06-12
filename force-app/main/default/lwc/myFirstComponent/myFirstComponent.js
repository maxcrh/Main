import { LightningElement, track } from 'lwc';

export default class MyFirstComponent extends LightningElement {
    greeting = 'Trailblazer';
    time = 'Meu time';
    currentDate = new Date().toDateString();

    @track
    contacts = [
        {
            Id: 1,
            Name: 'Amy Taylor',
            Title: 'VP of Engineering',
        },
        {
            Id: 2,
            Name: 'Michael Jones',
            Title: 'VP of Sales',
        },
        ,
        {
            Id: 3,
            Name: 'Jennifer Wu',
            Title: 'CEO',
        },
    ];

    get capitalizedGreeting() {
        return `Hello ${this.greeting.toUpperCase()}!`;
    }

    handleGreetingChange(event){
        this.greeting = event.target.value;
    };

    handleTimeChange(event){
        this.time = event.target.value;
        alert(this.time + ' - ' +  this.greeting + ' Data atual:' + this.currentDate);
    };

    
}