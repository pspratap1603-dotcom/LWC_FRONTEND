public class DMLDemo {
    public static void deleteDemo(){
        List<Account> accList = new List<Account>();
        accList = [SELECT Id, Name, Rating FROM Account
                   WHERE Name LIKE 'Test Upsert % ' ALL ROWS];
        if(!accList.isEmpty()){
            undelete accList;
            
        }
        
    }
    public static void updateDemo(){
        List<Account> accList = new List<Account>();
        accList = [SELECT Id, Name, Rating FROM Account
                   WHERE Rating = 'Hot'];
        if(!accList.isEmpty()){
            for(Account acc: accList){
                acc.Industry = 'Energy';
            }    
        }
        
        update accList;
        
        try{
            for(Integer i=1; i<=200; i++){
                Account acc = new Account();
                //acc.Name = 'Test Upsert ' +i;
                acc.Active__c = 'Yes';
                accList.add(acc);
            }
            if(!accList.isEmpty()){
                insert accList;
            }       
        }
        catch(DMLException e){
            System.debug(e);
        }
    }
    
    
    
    
    
    
    public static void insertDemo(){
        List<Account> accList = new List<Account>();
        //List<Contact> conList = new List<Contact>();
        
        for(Integer i=1; i<=200; i++){
            Account acc = new Account();
            acc.Name = 'Test DML ' +i;
            acc.Active__c = 'Yes';
            accList.add(acc);
        }
        
        insert accList;
        
        /*Account acc1 = new Account();
acc1.Name = 'Test DML 110';
acc1.Active__c = 'Yes';
accList.add(acc1); //DML2

insert accList;

//Linking contact with Account
Contact con = new Contact();
con.FirstName = acc.Name;
con.LastName = acc.Name;
con.AccountId = accList[0].Id;
conList.add(con);


Contact con1 = new Contact();
con1.FirstName = acc1.Name;
con1.LastName = acc1.Name;
con1.AccountId = accList[1].Id;
conList.add(con1);


insert conList;

System.debug('Account Id = ' +acc.Id);*/
        
        
        
    }
}