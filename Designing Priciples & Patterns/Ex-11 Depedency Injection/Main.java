public class Main {
    public static void main(String[] args) {
        // Create repository object
        CustomerRepository repository = new CustomerRepositoryImpl();

        // Inject repository into service
        CustomerService service = new CustomerService(repository);

        // Use service to get customer details
        service.getCustomerDetails("6439896");
    }
}
