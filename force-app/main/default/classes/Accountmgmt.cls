@RestResource(urlMapping = '/accountmgmt/')
global class Accountmgmt{
    @httpGet
    global static AccountWrapper getTopAccounts(){
        Map<String,String> paramsMap= RestContext.request.params;
        Set<Id> accountIdSet = new Set<Id>();
        String accIndustry = paramsMap.get('industry'); 
        List<Account> accList = [SELECT Id, Industry, Rating, annualrevenue
                                 from Account
                                 where annualrevenue != null and Industry = :accIndustry 
                                 order by annualrevenue desc limit 10
                                ];
        for(Account acc : accList){
            accountIdSet.add(acc.Id);
            
        }
        List<Contact> conList = [SELECT Id, lastname, firstname, email from contact where accountId in :accountIdSet ];
        List<Case> caseList = [SELECT Id, priority, subject from case where accountId in :accountIdSet ];
        AccountWrapper accWrapper = new AccountWrapper();
        accWrapper.accList = accList;
        accWrapper.conList = conList;
        accWrapper.caseList = caseList;
        return accWrapper;
    }
    
    @httpPost
    /*global static String createAccount(String accName, String accRating, String accIndustry){
Account acc = new Account();
acc.Name = accName;
acc.Rating = accRating;
acc.Industry = accIndustry;
try{
insert acc;
return 'Account created successfully';
}catch(exception ex){
return ex.getMessage();  
}
}*/
    
    global static String createAccountAndContact(AccountInformation information){
        Account accrecord = information.accountRecord;
        Contact conrecord = information.contactRecord;
        try{
            insert accrecord;
            conrecord.accountId = accrecord.Id;
            insert conrecord;
            return 'Account and Contact Created Successfully'; 
        } catch (exception ex){
            return ex.getMessage();
        }
    }
    global class AccountWrapper{
        global List<Account> accList;
        global List<Contact> conList;
        global List<Case> CaseList;
        
    }
    
    @httpdelete
    global static String deleteAccount(){
        Map<String,String> paramsMap= RestContext.request.params;
        String accountId = paramsMap.get('accid');
        List<Account> accList = [SELECT Id from account where id = :accountId];
        if(!accList.isEmpty()){
            try{
                delete accList;
                return 'Record Deleted Successfully';
            }catch(exception ex){
                return ex.getMessage();
            }
        }else{
            return 'Record not found';
        }
    }
    
    
    global class AccountInformation{
        global Account accountRecord {get;set;}
        global Contact contactRecord {get;set;}
    }
    
}