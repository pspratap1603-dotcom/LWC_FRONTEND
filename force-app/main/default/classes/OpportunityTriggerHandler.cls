public class OpportunityTriggerHandler {
    public static void Calculate(List<Opportunity> oppList){
        for(Opportunity opp : oppList){
            if(opp.Amount != null && opp.Amount >= 100000 && opp.Amount <= 500000){
                opp.Description = 'Hot Opportunity';
            } 
        }
    }   
}