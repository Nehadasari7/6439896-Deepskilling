public class Main {
    public static void main(String[] args) {
        // Base notifier
        Notifier notifier = new EmailNotifier();

        // Add SMS and Slack as decorators
        notifier = new SMSNotifierDecorator(notifier);
        notifier = new SlackNotifierDecorator(notifier);

        // Send message
        notifier.send("System alert: CPU usage is high.");
    }
}
