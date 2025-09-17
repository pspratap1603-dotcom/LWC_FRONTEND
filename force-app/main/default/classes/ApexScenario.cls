public class ApexScenario {
    public static void SC1(){
        List<Account> accList = new List <Account>();
        accList = [SELECT Id, Name, (SELECT Id FROM Contacts)
                   FROM Account WHERE Phone != null];
        if(!accList.isEmpty()){
            for(Account acc: accList){
                System.debug(acc.Name+ 'has' +acc.Contacts.size() + 'Contacts related');
            }
        }
        
    }
    
    public static void SC2(){
        List <Account> accList = new List<Account>();
        accList = [SELECT Id, Name, (SELECT Id, Amount FROM Opportunities)
                   FROM Account WHERE Phone != null];
        if(!accList.isEmpty()){
            for(Account acc: accList){
                Decimal total = 0;
                for(Opportunity opp : acc.Opportunities){
                    if(opp.Amount != null){
                        total = total+ opp.amount;
                        
                    }
                }
                System.debug(acc.Name+  'has' + total + 'Opportunities');          
            }
        }
    }
    
    public static void SC3(){
        List<Opportunity> oppList = new List <Opportunity>();
        oppList = [SELECT Id, StageName FROM Opportunity
                   WHERE CreatedDate = THIS_YEAR];
        if(!oppList.isEmpty()){
            for(Opportunity opp : oppList){
                if(opp.StageName == 'Closed Won'){
                    opp.Description = 'Opportunity is Closed Won';
                }else if(opp.StageName == 'Closed Lost'){
                    opp.Description = 'Opportunity is Closed Lost';
                    
                }else{
                    opp.Description = 'Opportunity is Open';
                }
            }
            update oppList;
        }
        
    }
}