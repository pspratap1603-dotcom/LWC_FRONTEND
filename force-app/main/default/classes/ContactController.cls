public class ContactController {
    private string sortOrder ='FirstName';
    public List<Contact> getContacts(){
        list<Contact> results = Database.query(
            'SELECT Id, FirstName, LastName, Email ' + 
            'FROM Contact ' + 
            'ORDER BY ' + sortOrder + ' ASC ' +
            'LIMIT 10'
        );
        return results;
    }
}