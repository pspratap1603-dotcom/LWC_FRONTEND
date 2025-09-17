public class AccountTriggerHandler1 {
    public static void updateRating(List<Account> accList){
        
        for(Account acc : accList){
            if(acc.Industry == 'Media' || acc.Industry =='Energy'){
                acc.Rating = 'Hot';
            }
        }
    }
    public static void copyBillingToShipping(List<Account> accList){
        for(Account acc : accList){
            if(acc.CopyBillingToShipping__c){
                acc.ShippingCity = acc.BillingCity;
                acc.ShippingCountry = acc.BillingCountry;
                acc.ShippingPostalCode = acc.BillingPostalCode;
                acc.ShippingState = acc.BillingState;
                acc.ShippingStreet= acc.BillingStreet;
                
            }
            
        }
    }
}