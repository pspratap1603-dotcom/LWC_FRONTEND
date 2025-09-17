@isTest
public class DailyOppProcessorTest {

    @isTest
    private static void testScheduledApex() {
        // Step 1: Create 500 test Opportunities
        List<Opportunity> oppList = new List<Opportunity>();
        for (Integer i = 0; i < 500; i++) {
            Opportunity opp = new Opportunity(
                Name = 'Test' + i,
                StageName = 'Prospecting',
                CloseDate = System.today()
            );

            if (i >= 250) {
                opp.LeadSource = 'Web';
            }

            oppList.add(opp);
        }

        insert oppList;

        Test.startTest();

        // Step 2: Schedule the batch job
        String sch = '0 0 0 * * ?'; // Run daily at midnight
        String jobId = System.schedule('Test Daily Opp Batch', sch, new DailyOppProcessor());

        Test.stopTest();

        // Step 3: Validate results (example: count opportunities updated)
        List<Opportunity> updatedOpp = [
            SELECT Id, LeadSource 
            FROM Opportunity 
            WHERE LeadSource = 'Web'
        ];

        System.assertEquals(250, updatedOpp.size(), 'Expected 250 opportunities with LeadSource = Web');
    }
}