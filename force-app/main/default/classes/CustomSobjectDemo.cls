public class CustomSobjectDemo {
    public static void CreateEmployee(){
        Employee__c emp = new Employee__c();
        emp.Name ='Kevin';
        emp.country__c ='India';
        emp.Age__c = 23;
        insert emp;
    }
}