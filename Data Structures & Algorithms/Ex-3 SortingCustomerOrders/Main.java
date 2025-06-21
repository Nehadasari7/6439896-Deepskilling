public class Main {
    public static void main(String[] args) {
        Order[] orders = {
                new Order("O001", "Alice", 3200.0),
                new Order("O002", "Bob", 1500.0),
                new Order("O003", "Charlie", 5400.0),
                new Order("O004", "David", 2500.0)
        };

        System.out.println("Original Orders:");
        OrderSorter.printOrders(orders);

        // Bubble Sort
        Order[] bubbleSorted = orders.clone();
        OrderSorter.bubbleSort(bubbleSorted);
        System.out.println("\nOrders Sorted by Bubble Sort:");
        OrderSorter.printOrders(bubbleSorted);

        // Quick Sort
        Order[] quickSorted = orders.clone();
        OrderSorter.quickSort(quickSorted, 0, quickSorted.length - 1);
        System.out.println("\nOrders Sorted by Quick Sort:");
        OrderSorter.printOrders(quickSorted);
    }
}