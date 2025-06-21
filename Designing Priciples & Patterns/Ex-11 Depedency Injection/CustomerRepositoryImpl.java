public class CustomerRepositoryImpl implements CustomerRepository {
    @Override
    public Customer findCustomerById(String id) {
        // Simulate fetching customer from a database
        System.out.println("Fetching customer from repository...");
        return new Customer(id, "Neha Dasari");
    }
}
