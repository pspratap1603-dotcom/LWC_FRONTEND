public class RectangleWithConstructor {
    Decimal length, breadth;
    //constructor
    public RectangleWithConstructor(){
        length = 5.5;
        breadth = 6;
    }
    //Method1
    public void area(){
        Decimal a = length * breadth;
        system.debug('Area = ' +a);  
    }
    //Method2
    public void perimeter(){
        Decimal p = 2 * (length + breadth);
        system.debug('Perimeter = ' +p);  

}
}