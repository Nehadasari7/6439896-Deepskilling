public class FinancialForecast {
    public static double forecastValue(double initialValue, double growthRate, int years) {
        if (years == 0) {
            return initialValue;
        }
        return forecastValue(initialValue, growthRate, years - 1) * (1 + growthRate);
    }

    public static double forecastIterative(double initialValue, double growthRate, int years) {
        double result = initialValue;
        for (int i = 1; i <= years; i++) {
            result *= (1 + growthRate);
        }
        return result;
    }
}
