public class AccountCalculator {
    @future
    public static void countContacts(List<Id> accIds) {
        List<Account> accList = [
            SELECT Id, Count_Number_of_Contacts__c,
                   (SELECT Id FROM Contacts)
            FROM Account
            WHERE Id IN :accIds
        ];

        for (Account acc : accList) {
            if (acc.Contacts != null) {
                acc.Count_Number_of_Contacts__c = acc.Contacts.size();
            } else {
                acc.Count_Number_of_Contacts__c = 0;
            }
        }

        if (!accList.isEmpty()) {
            update accList;
        }
    }
}