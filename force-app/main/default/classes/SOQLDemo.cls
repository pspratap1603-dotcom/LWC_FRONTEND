public class SOQLDemo {
    public static void QueryDemo(){
        //String indus = 'Media';
        Integer AR = 10000;
        Set<Id> accIds = new Set<Id>();
        List<Account> accList = [SELECT Id
                                 FROM Account LIMIT 10];
        for(Account acc: accList){
            accIds.add(acc.Id);
        }
        List<Account> accList1 =[SELECT Id, Industry, AnnualRevenue
                                 FROM Account
                                 WHERE Id IN: accIds];
        
        System.debug([SELECT Count(Name) FROM Account]);
    }
    public static void aggDemo() {
        // Group Opportunities by AccountId and sum the Amount field
        AggregateResult[] groupedResults = [SELECT AccountId, SUM(Amount) sumAmount
                                            FROM Opportunity
                                            GROUP BY AccountId
                                           ];
        
        for (AggregateResult ar : groupedResults) {
            System.debug('Account ID = ' + ar.get('AccountId'));
            System.debug('Sum of Amount = ' + ar.get('exprO'));
        }
    }
    public static void ParentChildDemo(){
        List<Account> accList = new List<Account>();
        accList = [SELECT Id, Name, (SELECT Id, FirstName, LastName FROM Contacts) 
                   FROM Account WHERE Rating = 'Hot'];
        for(Account acc : accList){
            System.debug('Account Name' +acc.Name);
            for(Contact con : acc.Contacts){
                System.debug(con.FirstName + ' ' + con.LastName);
            }
        }
        
        
    }  
}