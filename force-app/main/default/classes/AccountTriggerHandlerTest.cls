@isTest
public class AccountTriggerHandlerTest {
    @isTest
    public static void updateRatingTest(){
        //	Creating Sample data
        List<Account> accList = new List <Account>();
        for(Integer i = 1; i<=5; i++){
            Account acc = new Account();
            acc.Name= 'Test'+i;
            acc.Industry = 'Energy';
            accList.add(acc);
        }
        // Insert data
        Test.startTest();
        insert accList;
        Test.stopTest();
        
        List <Account> updatedAccList = [SELECT Id, Rating FROM Account 
                                       WHERE Id =: accList[0].id];
        //apply assert condition
        System.assertEquals('Hot', updatedAccList[0].Rating);
    }
}