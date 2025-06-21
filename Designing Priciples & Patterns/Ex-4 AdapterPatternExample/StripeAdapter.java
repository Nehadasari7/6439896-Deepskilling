
public class StripeAdapter implements PaymentProcessor {
    private StripeGateway stripeGateway;

    public StripeAdapter(StripeGateway gateway) {
        this.stripeGateway = gateway;
    }

    @Override
    public void processPayment(double amount) {
        stripeGateway.makePayment(amount);
    }
}
