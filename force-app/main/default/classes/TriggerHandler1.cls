public class TriggerHandler1 {
    list <Account> accList = new List <Account>();
    public static void preventDeletion(List <Account> accList){
        Profile p = [SELECT Id FROM Profile
                     WHERE Name = 'System Administrator'];
        
        for (Account acc : accList){
            if(UserInfo.getProfileId() != p.Id || acc.Active__c == 'Yes'){
                acc.addError(Label.Prvent_Account_Deletion);
            }
        }
    }
}