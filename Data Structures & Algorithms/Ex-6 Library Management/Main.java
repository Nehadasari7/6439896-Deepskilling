public class Main {
    public static void main(String[] args) {
        LibraryManager library = new LibraryManager(10);

        library.addBook(new Book("B001", "Java Programming", "Neha Dasari"));
        library.addBook(new Book("B002", "Data Structures", "Ravi Teja"));
        library.addBook(new Book("B003", "Operating Systems", "Kiran Kumar"));
        library.addBook(new Book("B004", "Design Patterns", "Sneha Roy"));

        library.displayBooks();

        library.linearSearch("Operating Systems");
        library.binarySearch("Design Patterns");
        library.binarySearch("Algorithms");
    }
}