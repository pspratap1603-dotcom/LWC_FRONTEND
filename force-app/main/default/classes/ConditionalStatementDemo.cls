public class ConditionalStatementDemo {
    public static void max(Integer num1, Integer num2){
        //Integer num1 = 20, num2 = 40;
        if(num1>num2){
            System.debug('num1 is max as compared to num2');
            
        }else{
            System.debug('num2 is max as compared to num1');
        }
    }
    
/*public static void condition(Integer num1, Integer num2){
Integer result;
result = num1>num2 ? num1 : num2;
System.debug('Maximum =' +result);
*/
    
    public static void Eligible(Integer age){
        //Integer age = 19;
        if(age>=18){
            System.debug('Eligible for voting');
            
        }else{
            System.debug('Not Eligible for voting');
        }
    }
    public static void evenodd(Integer num){
        //Integer num;
        if(Math.mod(num,2)==0){
            System.debug('Even');
        }else{
            System.debug('Odd');
        }
    }
    public static void positiveelseif(Integer num1){
        //Integer num1;
        if(num1>0){
            System.debug('positive');
        }else if(num1<0){
            System.debug('negative');
        }else{
            System.debug('zero');
        }
    }
    public static void positivenestedif(Integer num1){
        if(num1>=0){
            if(num1>0){
                System.debug('positive');  
            }
            else{
                System.debug('zero');
            }
        }else{
            System.debug('negative');
        }
    }
    public static void logicaloperatorDemo(){
        Integer num1 = 10, num2 = 30;
        if(num1>50 || num2>100){
            System.debug('true');
            
        }else{
            System.debug('false');
        }
    }
    public static void nummCheckDemo(){
        List<Account> accList = new List <Account>();
        accList = [Select Id from Account LIMIT 5];
        if(!accList.isEmpty()){
            System.debug('List Contains' + accList);
        }   
        //OR
        if(accList.size()>0){
            System.debug('List Contains' + accList);
        }
    }
    public static void condition(Integer num1, Integer num2){
        Integer result;
        result = num1>num2 ? num1 : num2;
        System.debug('Maximum =' +result);
    }
}