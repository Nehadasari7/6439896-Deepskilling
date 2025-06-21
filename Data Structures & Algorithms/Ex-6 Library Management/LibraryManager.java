import java.util.Arrays;
import java.util.Comparator;

public class LibraryManager {
    private Book[] books;
    private int count;

    public LibraryManager(int size) {
        books = new Book[size];
        count = 0;
    }

    public void addBook(Book book) {
        if (count < books.length) {
            books[count++] = book;
            System.out.println("Added: " + book);
        } else {
            System.out.println("Library is full!");
        }
    }

    public void linearSearch(String title) {
        System.out.println("\nLinear Search for title: " + title);
        for (int i = 0; i < count; i++) {
            if (books[i].getTitle().equalsIgnoreCase(title)) {
                System.out.println("Found: " + books[i]);
                return;
            }
        }
        System.out.println("Book not found!");
    }

    public void binarySearch(String title) {
        System.out.println("\nBinary Search for title: " + title);
        Arrays.sort(books, 0, count, Comparator.comparing(Book::getTitle));
        int left = 0, right = count - 1;
        while (left <= right) {
            int mid = (left + right) / 2;
            int cmp = books[mid].getTitle().compareToIgnoreCase(title);
            if (cmp == 0) {
                System.out.println("Found: " + books[mid]);
                return;
            } else if (cmp < 0) {
                left = mid + 1;
            } else {
                right = mid - 1;
            }
        }
        System.out.println("Book not found!");
    }

    public void displayBooks() {
        System.out.println("\nAll Books:");
        for (int i = 0; i < count; i++) {
            System.out.println(books[i]);
        }
    }
}