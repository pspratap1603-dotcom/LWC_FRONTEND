public class Rectangle {
    //Method1
    public void area(){
        Decimal length = 5.5, breadth = 6; // variables creation
        Decimal a = length * breadth;
        system.debug('Area = ' +a);  
    }
    //Method2
    public void perimeter(){
        Decimal length = 5.5, breadth = 6; // variables creation
        Decimal a = 2 * (length + breadth);
        system.debug('Perimeter = ' +a);  
    }
}