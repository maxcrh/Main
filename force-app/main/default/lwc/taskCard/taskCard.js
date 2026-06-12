import { LightningElement, api } from 'lwc';

export default class taskCard extends LightningElement {
    @api Description;
    @api Id;
    @api iconName;

    editClick(event){
        this.sendClickEvent('edit', this.id);
    }

    deleteClick(event){
        this.sendClickEvent('delete', this.id);
    }

    sendClickEvent(eventName, identification){
        const taskEventClick = new CustomEvent('taskEventClick', {
            detail: {
                Action : eventName,
                Id : identification
            }
        });

        this.dispatchEvent(taskEventClick);
    }
}