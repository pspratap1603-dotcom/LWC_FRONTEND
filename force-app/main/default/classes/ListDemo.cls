public class ListDemo {
    public static void sObjectListDemo(){
        List<Account> accList = new List<Account>();
        Account acc1 = new Account(Name='Kulamani');
        accList.add(acc1);
        	
        Account acc2 = new Account();
        acc2.Name = 'Emli';
        accList.add(acc2);
        
        insert accList;
    
    }
    
    
    
    
    public static void ListDemo(){
        List<String> colors = new List<String>();
        colors.add('Red');
        colors.add('Green');
        colors.add('Yellow');
        System.debug('Colors List Contains= ' +colors);
        colors.add(1,'Black');
        System.debug('Colors List Contains= ' +colors);
        
        List<String> colorsList2 = new List<String>();
        colorsList2.add('Pink');
        colorsList2.add('White');
        colors.addAll(colorsList2);
        System.debug('Colors List Contains= ' +colors);
        System.debug('ColorsList2 List Contains= ' +colorsList2);
        colorsList2.clear();
        System.debug('ColorsList2 List Contains= ' +colorsList2);
        
        List<String> clonedList = new List<String>();
        clonedList = colors.clone();
        System.debug('clonedList Contains' +clonedList);
        
        System.debug('Colors List Contains= ' +colors.contains('Red'));
        System.debug('Colors List Contains= ' +colors.equals(clonedList));
        System.debug('Colors List Contains= ' +colors.get(1));
        System.debug('Colors List Contains= ' +colors.indexOf('Black'));
        System.debug('Empty = ' + colors.isEmpty());
        System.debug('Empty = ' + colorsList2.isEmpty());
        colors.remove(3);
        System.debug('Colors List Contains= ' +colors);
        System.debug('Size'+ colors.size());
        System.debug('Size'+ colorsList2.size());
        colors.sort();
        System.debug('Sorted Values = ' + colors);
 
        
    }
}