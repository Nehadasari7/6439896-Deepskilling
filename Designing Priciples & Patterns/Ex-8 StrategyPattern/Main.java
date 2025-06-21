public class Main {
    public static void main(String[] args) {
        PaymentContext context = new PaymentContext();

        // Pay using Credit Card
        context.setPaymentStrategy(new CreditCardPayment("1234567812345678"));
        context.payAmount(2500.00);

        // Pay using PayPal
        context.setPaymentStrategy(new PayPalPayment("user@example.com"));
        context.payAmount(4200.50);
    }
}
