import { LightningElement, api } from 'lwc';

export default class HeroTile extends LightningElement {
    @api heroes;

    tileClick() {
        const event = new CustomEvent('tileclick', {
            // detail contains only primitives
            detail: this.heroes.Id
        });
        // Fire the event from c-tile
        this.dispatchEvent(event);
    }
}