public class SetDeno {
    //Create a set of Account Ids and display Ids using System.debug();
    public static void demoSObjectWithSet(){
        Set<Id> accIds = new Set<Id>();
        List<Account> accList = new List<Account>();
        accList = [SELECT Id, Name FROM Account LIMIT 5];
        for(Account acc : accList){
            accIds.add(acc.Id);
        }
        System.debug('Set Contains = ' + accIds);
    }
        
    public static void demo(){
        Set<Integer> intSet = new Set<Integer>();
        List<Integer> intList = new List<Integer>();
        Set<Integer> intSet2 = new Set <Integer>();
        
        intSet.add(10);
        intSet.add(20);
        intSet.add(30);
        intSet.add(20);
        
        intList.add(50);
        intList.add(60);
        intList.add(30);
        
        intSet.addAll(intList);
        System.debug('Set contains = ' + intSet);
        intSet2 = intSet.clone();
        System.debug('Set contains = ' + intSet2);
        System.debug('Element is available = ' +intSet.contains(30));
        System.debug('Element is available = ' +intSet.containsAll(intList));
        System.debug('Eqal = ' + intSet.equals(intSet2) );
        System.debug('Empty = ' + intSet.isEmpty());
        intSet.remove(20);
        System.debug('Set contains = ' + intSet); //10,30,60,50
        intSet.removeAll(intList);
        System.debug('Set contains = ' + intSet);        
        System.debug('Set contains = ' + intSet2);
        intSet2.retainAll(intList);
        System.debug('Set contains = ' + intSet2);
        System.debug('Size = ' + intSet.size());
        
    }
}