public class Main {
    public static void main(String[] args) {
        StockMarket stockMarket = new StockMarket();

        Observer mobileApp = new MobileApp("InvestorPlus");
        Observer webApp = new WebApp("StockWatcher");

        stockMarket.registerObserver(mobileApp);
        stockMarket.registerObserver(webApp);

        stockMarket.setStockPrice("Cognizant", 3450.75);
        stockMarket.setStockPrice("INFY", 1502.30);
    }
}
