import { LightningElement } from 'lwc';

export default class ConnectedCallbackDemo extends LightningElement {
    name = 'Car';
    price = 100000;
    ready = false;
    connectedCallback(){
        setTimeout(() => {
            this.ready = true;
        }, 6000);
    }
     renderedCallback() {
        console.log('Component rendered successfully');
}
}