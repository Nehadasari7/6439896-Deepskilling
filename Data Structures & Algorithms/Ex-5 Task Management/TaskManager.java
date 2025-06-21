public class TaskManager {
    private Task head;

    // Add task to the end of the list
    public void addTask(String taskId, String taskName, String status) {
        Task newTask = new Task(taskId, taskName, status);
        if (head == null) {
            head = newTask;
        } else {
            Task current = head;
            while (current.next != null) {
                current = current.next;
            }
            current.next = newTask;
        }
        System.out.println("Added: " + newTask);
    }

    // Search task by ID
    public void searchTask(String taskId) {
        Task current = head;
        while (current != null) {
            if (current.taskId.equals(taskId)) {
                System.out.println("Found: " + current);
                return;
            }
            current = current.next;
        }
        System.out.println("Task not found!");
    }

    // Traverse tasks
    public void displayTasks() {
        System.out.println("\nAll Tasks:");
        Task current = head;
        while (current != null) {
            System.out.println(current);
            current = current.next;
        }
    }

    // Delete task by ID
    public void deleteTask(String taskId) {
        if (head == null)
            return;

        if (head.taskId.equals(taskId)) {
            System.out.println("Deleted: " + head);
            head = head.next;
            return;
        }

        Task current = head;
        while (current.next != null && !current.next.taskId.equals(taskId)) {
            current = current.next;
        }

        if (current.next != null) {
            System.out.println("Deleted: " + current.next);
            current.next = current.next.next;
        } else {
            System.out.println("Task not found!");
        }
    }
}
