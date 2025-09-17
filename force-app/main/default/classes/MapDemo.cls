public class MapDemo {
    //Create a Map of Account Id as keys and Account as Value Using Loop and without using loop.
    //Display the following using System.debug
    //Map with Keys and Values
    //All keys of Map
    //All Values of Map
    
    public static void sobjectDemo(){
        List<Account> accList = new List<Account>();
        accList = [SELECT Id, Name, Phone FROM Account LIMIT 5];
        Map<Id, Account> accMap = new Map<Id, Account>(accList); //List will be converted into Map
        System.debug('Map Contains: ' +accMap);
        System.debug('Map Keys: ' +accMap.keySet());
        System.debug('Map Values: ' +accMap.values());
    }
    
    public static void sobjectDemoWithLoop(){
        List<Account> accList = new List<Account>();
        accList = [SELECT Id, Name, Phone FROM Account LIMIT 5];
        Map<Id, Account> accMap = new Map<Id, Account>(); 
        for(Account acc: accList){
            accMap.put(acc.Id, acc);
        }
        System.debug('Map Contains: ' +accMap);
        System.debug('Map Keys: ' +accMap.keySet());
        System.debug('Map Values: ' +accMap.values());
    }
    
    
    
    
    public static void demo(){
        Map<Integer, String> colors = new Map<Integer, String>();
        Map<Integer, String> moreColors = new Map<Integer, String>();
        Map<Integer, String> colors2 = new Map<Integer, String>();
        colors.put(1, 'Green');
        colors.put(2, 'Red');
        colors.put(6, 'Pink');
        System.debug('Map Contains= ' +colors);
        moreColors.put(3, 'Orange');
        moreColors.put(5, 'Black');
        colors.putAll(moreColors);
        System.debug('Map Contains= ' +colors);
        colors.remove(1);
        System.debug('Map Contains= ' +colors);
        System.debug('Map Contains= ' +colors.size());
        System.debug('Map Contains= ' +colors.values());
        colors2 = colors.clone();
        System.debug('Map Contains= ' +colors2);
        System.debug('Map Contains= ' +colors2.containsKey(6));
        System.debug('Map Contains= ' +colors2.containsKey(500));
        System.debug('Map Contains= ' +colors2.equals(colors));
        System.debug('Map Contains= ' +colors2.equals(moreColors));
        System.debug('Map Contains= ' +colors2.get(6));
        System.debug('Map Contains= ' +colors2.isEmpty());
        System.debug('Map keys  ' +colors2.keySet());
        Set<Integer> intSet = new Set<Integer> ();
        List<String> strList = new List <String>();
        intSet = colors2.keySet(); //Stores keys into a set
        strList = colors.values(); //Stores values into a list
        System.debug('Set Contains: ' +intSet);
        System.debug('Set Contains: ' + strList);
        
        
        
    }
    
}