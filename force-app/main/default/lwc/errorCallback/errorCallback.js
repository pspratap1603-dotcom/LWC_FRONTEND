import { LightningElement } from 'lwc';

export default class ErrorCallback extends LightningElement {
    error;
    stack;
    errorCallback(error,stack){
        this.error= error;
    }
    
}