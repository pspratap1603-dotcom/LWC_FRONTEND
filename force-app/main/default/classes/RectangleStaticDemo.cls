public class RectangleStaticDemo {
    //Method1
    public static void area(){
        Decimal length = 5.5, breadth = 6; // variables creation
        Decimal a = length * breadth;
        system.debug('Area = ' + a);  
    }
    //Method2
    public static void perimeter(){
        Decimal length = 5.5, breadth = 6; // variables creation
        Decimal p = 2 * (length + breadth);
        system.debug('Perimeter = ' + p); 
    }
}