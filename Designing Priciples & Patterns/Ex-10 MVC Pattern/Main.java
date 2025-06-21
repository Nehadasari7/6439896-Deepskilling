public class Main {
    public static void main(String[] args) {
        // Create Model
        Student student = new Student();
        student.setName("Neha Dasari");
        student.setId("6439896");
        student.setGrade("A");

        // Create View
        StudentView view = new StudentView();

        // Create Controller
        StudentController controller = new StudentController(student, view);

        // Display original data
        controller.updateView();

        System.out.println("\nUpdating student data...\n");

        // Update model data
        controller.setStudentName("Dasari Neha");
        controller.setStudentGrade("A+");

        // Display updated data
        controller.updateView();
    }
}
