trigger OpportunityTrigger on Opportunity (before insert) {
    OpportunityTriggerHandler.Calculate(Trigger.new);
}