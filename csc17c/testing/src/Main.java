import java.util.Random;

/**
 * Created by rcc on 10/7/2015.
 */
public class Main {
    public static void main(String[] args) {
        Main m = new Main( );
        m.run( );

//        merge m = new merge( );
//        m.run( );
    }

    public void run( ) {

        //test the recursive tan
//        for ( float rad = -1; rad <= 1; rad += 0.1f ) {
//            print( "percentage off: " );
//            println( ( Math.tan( rad ) - rtan( rad ) ) / Math.tan( rad ) * 100 );
//        }

        //test recurisve max
        int[] arr = fill( 100 );
        //print array
        arrPrint( arr, 10 );
        //output max
        println( "the max in the array = " + rmax( arr, 0, arr.length - 1 ) );
    }

    double rtan(double x) {
        double tolerence = 1e-10;
        //declare base
        if ( Math.abs( x ) < tolerence ) return x + x * x * x / 3;
        double a = rtan( x / 2 );
        return 2 * a / ( 1 - a * a );
    }

    int[] fill(int s) {
        Random rand = new Random( );
        int[] a = new int[ s ];
        for ( int i = 0; i < s; i++ ) {
            a[ i ] = rand.nextInt( 100 );
        }
        return a;
    }

    void arrPrint(int[] a, int perline) {
        int s = a.length;
        for ( int i = 0; i < s; i++ ) {
            print( a[ i ] + " " );
            if ( i % perline == ( perline - 1 ) ) {
                println( );
            }
        }
        println( );
    }

    int rmax(int[] a, int beg, int end) {
        if ( ( end - beg ) <= 1 ) return a[ beg ];
        int half = ( end + beg ) / 2;
        int m1 = rmax( a, beg, half );
        int m2 = rmax( a, half + 1, end );
        return ( m1 < m2 ) ? m2 : m1;
    }


    void println(Object o) {
        System.out.println( o );
    }

    void println( ) {
        System.out.println( );
    }

    void print(Object o) {
        System.out.print( o );
    }


}
