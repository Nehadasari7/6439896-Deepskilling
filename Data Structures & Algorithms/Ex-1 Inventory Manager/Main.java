public class Main {
    public static void main(String[] args) {
        InventoryManager manager = new InventoryManager();

        Product p1 = new Product("P001", "Keyboard", 10, 799.0);
        Product p2 = new Product("P002", "Mouse", 20, 499.0);

        manager.addProduct(p1);
        manager.addProduct(p2);

        manager.displayInventory();

        manager.updateProduct("P001", 15, 749.0);
        manager.deleteProduct("P002");

        manager.displayInventory();
    }
}
