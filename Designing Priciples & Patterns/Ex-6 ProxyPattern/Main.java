public class Main {
    public static void main(String[] args) {
        Image img1 = new ProxyImage("pic1.jpg");

        // Image will be loaded from remote server
        img1.display();

        System.out.println();

        // Image will be loaded from cache
        img1.display();
    }
}
