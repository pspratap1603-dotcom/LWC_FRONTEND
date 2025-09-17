trigger AccountTrigger on Account(before insert, after insert, before update, after update, before delete){
    if(Trigger.isInsert){
        if(Trigger.isBefore){
            //TriggerHandler.updateDesc(Trigger.New);
            TriggerHandler.populateRating(Trigger.New, null);
        }else if(Trigger.isAfter){
            TriggerHandler.createOpp(Trigger.New);
            
        }
    }
    if(Trigger.isUpdate){
        if(Trigger.isBefore){
            TriggerHandler.updatephone(Trigger.New, Trigger.oldMap);
            TriggerHandler.populateRating(Trigger.New, Trigger.oldMap);
        }else if (Trigger.isAfter){
            TriggerHandler.updateRelatedContact(Trigger.New, Trigger.oldMap);
            
        }
    }
    
    
    if(Trigger.isDelete){
        if(Trigger.isBefore){
            TriggerHandler1.preventDeletion(Trigger.old);
        }else if(Trigger.isAfter){
            
        }       
    }
}

/*Test 1: By Creating record through UI
Test 2: By Creating record through Code
Test 3: By Creating Bulk records through Code*/