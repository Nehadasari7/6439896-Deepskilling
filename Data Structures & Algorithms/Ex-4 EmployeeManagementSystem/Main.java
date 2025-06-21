public class Main {
    public static void main(String[] args) {
        EmployeeManager manager = new EmployeeManager(5);

        manager.addEmployee(new Employee("E001", "Neha", "Developer", 65000));
        manager.addEmployee(new Employee("E002", "Ravi", "Manager", 75000));
        manager.addEmployee(new Employee("E003", "Kiran", "Designer", 55000));

        manager.displayAllEmployees();

        manager.searchEmployee("E002");

        manager.deleteEmployee("E001");

        manager.displayAllEmployees();
    }
}