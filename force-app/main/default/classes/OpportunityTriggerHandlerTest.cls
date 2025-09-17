@isTest
public class OpportunityTriggerHandlerTest {
    @isTest
    public static void CalculateTest(){
        // Create data
        List <Opportunity> oppList = new List <Opportunity>();
        for(Integer i = 1; i<=5; i++){
            Opportunity opp = new Opportunity();
            opp.Name = 'TestOpp'+i;
            opp.StageName = 'Prospecting';
            opp.CloseDate = System.today();
            opp.Amount = 200000;
            oppList.add(opp);
        }
        Test.startTest();
        insert oppList;
        Test.stopTest();
        
        List<Opportunity> updatedOpportunityList = [SELECT Id, Description FROM Opportunity
                                                   WHERE Id =: oppList[0].Id];
        System.assertEquals('Hot Opportunity', updatedOpportunityList[0].Description);
    }  
}