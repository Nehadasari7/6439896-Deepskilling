public class CustomerService {
    private CustomerRepository customerRepository;

    // Constructor injection
    public CustomerService(CustomerRepository customerRepository) {
        this.customerRepository = customerRepository;
    }

    public void getCustomerDetails(String id) {
        Customer customer = customerRepository.findCustomerById(id);
        System.out.println("Customer ID   : " + customer.getId());
        System.out.println("Customer Name : " + customer.getName());
    }
}
