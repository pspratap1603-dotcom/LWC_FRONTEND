public class TriggerHandler {   
    public static void updateRelatedContact(List<Account> accList, Map<Id, Account> accMap1){
        List<Contact> conList = new List<Contact> ();
        Map<Id, Account> accMap = new Map<Id, Account>();
        for(Account acc : accList){
            //Map will store only those accounts whose phone is updated
            Account oldAcc = (accMap != null) ? accMap.get(acc.Id) : null;
            if(acc.Phone != accMap.get(acc.Id).Phone ){
                accMap1.put(acc.Id, acc);
            }
        }
        for(Contact con : [SELECT Id, HomePhone, AccountId FROM Contact
                           WHERE AccountId IN: accMap1.keySet()]){
                               if(accMap1.containsKey(con.AccountId)){
                                   con.HomePhone = accMap.get(con.AccountId).Phone;
                                   conList.add(con);
                                   
                               }
                           }
        if(!conList.isEmpty()){
            update conList;
        }       
    }

    public static void populateRating(List<Account> accList, Map<Id, Account> accMap){
        for(Account acc : accList){
            
   if (acc.Industry == 'Media') {
        Account oldAcc = (accMap != null) ? accMap.get(acc.Id) : null;

        if (oldAcc == null || oldAcc.Industry != 'Media') {
            acc.Rating = 'Hot';
        }
    }
}
    } 

    public static void updatephone(List<Account> accList, Map<Id, Account> accMap ){
        for(Account acc : accList){
            if(acc.Phone != accMap.get(acc.Id).Phone){
                acc.Description = 'Phone is updated | Old value = ' +accMap.get(acc.Id).Phone
                    + 'New Value = ' + acc.Phone;
            }
        }   
    }
    public static void updateDesc(List<Account> accList){
        for(Account acc : accList){
            acc.Description ='Account is created';
        }
    }
    
    

    
    public static void createOpp(List<Account> accList){
        List<Opportunity> oppList = new List<Opportunity>();
        for(Account acc : accList){
            Opportunity opp = new Opportunity();
            opp.Name = acc.Name;
            opp.CloseDate = System.today();  //stores today's date
            opp.StageName = 'Prospecting';
            opp.AccountId = acc.Id;
            oppList.add(opp);
        }   
        if(!oppList.isEmpty()){
            insert oppList;
                }
    }
}