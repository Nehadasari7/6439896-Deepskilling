public class Main {
    public static void main(String[] args) {
        TaskManager manager = new TaskManager();

        manager.addTask("T001", "Design UI", "Pending");
        manager.addTask("T002", "Develop backend", "In Progress");
        manager.addTask("T003", "Testing", "Pending");

        manager.displayTasks();

        manager.searchTask("T002");

        manager.deleteTask("T001");

        manager.displayTasks();
    }
}
