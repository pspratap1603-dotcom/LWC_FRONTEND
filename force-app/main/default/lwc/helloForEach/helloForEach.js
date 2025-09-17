import { LightningElement } from 'lwc';
export default class HelloForEach extends LightningElement {
    contacts = [
        {
            Id:1,
            Name:'Pruthvi Mahana',
            Title:'Software Engineer'
        },
        {
            Id:2,
            Name:'Debashis Mahakur',
            Title:'Software Engineer'
        },
        {
            Id:3,
            Name:'Virat Kohli',
            Title:' Senior Software Engineer'
        },
    ];
}