public class Main {
    public static void main(String[] args) {
        Product[] products = {
            new Product(1, "Shoes", "Footwear"),
            new Product(2, "Laptop", "Electronics"),
            new Product(3, "T-shirt", "Apparel"),
            new Product(4, "Smartphone", "Electronics")
        };

        System.out.println("Linear Search for 'Laptop':");
        Product p1 = LinearSearch.search(products, "Laptop");
        System.out.println(p1);

        System.out.println("\nBinary Search for 'Laptop':");
        Product p2 = BinarySearch.search(products, "Laptop");
        System.out.println(p2);
    }
}
