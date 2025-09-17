public class LoopDemo {
    //1 to 10 print
    public static void forDemo(){
        for (Integer i =1; i<=10; i++){
            System.debug(i);
        }
    } 
    //Table of a number
    public static void table(Integer n){
        for(Integer i=1; i<=10; i++){
            System.debug(n*i); //n= 5*1, 5*2, 5*3.....
        }
    }
    //Table of a number while
    public static void tablewhile(Integer n){
        Integer i=1;
        while(i<=10){
            System.debug(n*i); //n= 5*1, 5*2, 5*3.....
            i++;
        }
    }  
    //Even or add numbers upto n
    public static void evenoddn(Integer n){
        for (Integer i = 1; i<=n; i++){
            if(Math.mod(i,2)==0){
                System.debug(i);
            }
        } 
    }
    public static void oddn(Integer n){
        for (Integer i = 1; i<=n; i++){
            if(Math.mod(i,2)!=0){
                System.debug(i);
            }
        } 
    }
    //Sum of natural numbers
    public static void natural(Integer n){
        Integer i, sum=0;
        for(i=1; i<=n; i++){
            sum = sum + i;
        }
        System.debug('Sum=' +sum);
    }
    
    //Iterate on Account List and Display account information
    //Iterate on Account List and create a set of account Ids
    public static void showList(){
        List<Account> accList = new List <Account>();
        Set<Id> accIds = new Set <Id>();
        Map<Id, Account> accMap = new Map <Id, Account>();
        accList = [SELECT Id, Name FROM Account LIMIT 5];
        
        //Iteration on Account List to display data and create set and map
        System.debug('Display Data through List');
        If(!accList.isEmpty()){
            for (Account acc : accList){
                System.debug(acc.Id + '-' + acc.Name);
                accIds.add(acc.Id);   // set is created
                accMap.put(acc.Id,acc);  //map is created
            }
        }
        
        //Display accIds through Set
        System.debug('Display Data through Set');
        if(!accIds.isEmpty()){
            for(Id accId : accIds){
                System.debug(accId);
            }
        }
        
        //Iterate Map based on Keys
        System.debug('Display Data through Map Keys');
        if(!accMap.isEmpty()){
            for(Id accId : accMap.keySet()){
                System.debug(accId);
            }
        }
        
        //Iterate Map based on Values
        System.debug('Display Data through Map Values');
        if(!accMap.isEmpty()){
            for(Account acc : accMap.Values()){
                System.debug(acc);
            }
        }
    }
    
    
}