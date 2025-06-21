public class Main {
    public static void main(String[] args) {
        double initial = 1000.0;
        double rate = 0.10;
        int years = 5;

        double futureRecursive = FinancialForecast.forecastValue(initial, rate, years);
        double futureIterative = FinancialForecast.forecastIterative(initial, rate, years);

        System.out.printf("Recursive Future Value after %d years: Rs.%.2f\n", years, futureRecursive);
        System.out.printf("Iterative Future Value after %d years: Rs.%.2f\n", years, futureIterative);
    }
}
