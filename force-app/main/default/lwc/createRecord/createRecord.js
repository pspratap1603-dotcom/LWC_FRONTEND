import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import WEBSITE_FIELD from '@salesforce/schema/Account.Website';

export default class CreateRecord extends LightningElement {
    accountObject = ACCOUNT_OBJECT;
    myFields = [NAME_FIELD, WEBSITE_FIELD];

    handleAccountCreated(event) {
        this.dispatchEvent(
            new ShowToastEvent({
                title: 'Account record Created Successfully!!!',
                message: event.detail.message,
                variant: 'success',
            })
        );
    }
}