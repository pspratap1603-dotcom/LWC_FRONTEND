public class AccountRecord {
    public static void insertData(){
        Account acc = new Account();
        acc.Name = 'Virat';
        acc.Rating = 'Hot';
        insert acc; //this statement will insert a record into org
    }
    public static void insertAccountWithConAndOpp(String name, String rating, String active){
        Account acc = new Account();
        acc.Name = name;
        acc.Rating = rating;
        acc.Active__c = active;
        insert acc;
        Contact con = new Contact(FirstName ='Ankita', LastName ='Nayak');
        con.accountId = acc.Id; //accountId is lookup to account
        insert con;
        Opportunity opp = new Opportunity();
        opp.Name = 'Opp 100';
        opp.CloseDate = System.today();
        opp.StageName = 'Prospecting';
        opp.AccountId = acc.Id;
        insert opp;
        
    }
    
}