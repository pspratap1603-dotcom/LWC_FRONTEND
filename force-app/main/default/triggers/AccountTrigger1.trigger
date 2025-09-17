trigger AccountTrigger1 on Account (before insert) {
    AccountTriggerHandler1.updateRating(Trigger.New);
    AccountTriggerHandler1.copyBillingToShipping(Trigger.New);

}