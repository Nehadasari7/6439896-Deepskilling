
public class PayPalAdapter implements PaymentProcessor {
    private PayPalGateway payPalGateway;

    public PayPalAdapter(PayPalGateway gateway) {
        this.payPalGateway = gateway;
    }

    @Override
    public void processPayment(double amount) {
        payPalGateway.sendPayment(amount);
    }
}
