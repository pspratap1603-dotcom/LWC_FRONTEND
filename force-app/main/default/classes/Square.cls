public class Square {
    //method1
    public static void area(){ //void is a return type and if we don't want to return a value to another method then we write void
        Decimal a= 5, area;
        area = a * a;
        system.debug('Area = ' + area);
    }
    
    //method2
    public static void perimeter(){
        Decimal a =5, peri;
        peri =  4 * a;
        system.debug('Perimeter = ' + peri);
    }
}