public class UpdateParentAccount implements Queueable {
    private List<Account> accList;
    private Id parentAccId;
    
    //Constructor
    public UpdateParentAccount(List<account> accRecords, Id accId){
        this.accList = accRecords;
        this.ParentAccId = accId;
    }
    
    public void execute(QueueableContext context){
        for(Account acc : accList){
            acc.ParentId = ParentAccId;
        }
        update accList;
    }
    
}