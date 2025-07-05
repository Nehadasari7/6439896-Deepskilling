This ZIP archive compares JPA, Hibernate, and Spring Data JPA.

1. Hibernate:
   - Located in hibernate/EmployeeDaoHibernate.java
   - Shows manual session and transaction handling.

2. Spring Data JPA:
   - Interface: springdata/EmployeeRepository.java
   - Service: springdata/EmployeeService.java
   - Shows how repository.save() simplifies operations.

JPA itself is only an interface and uses annotations like @Entity, @Id, etc. in entity classes.