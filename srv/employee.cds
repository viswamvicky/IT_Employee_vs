using employee.details as db from '../db/Dep';

@path: '/EmployeeSRV'
service EmployeeService {
    entity Employee as projection on db.Employee;
    entity Address as projection on db.Address;
    entity Department as projection on db.Department;
    entity Designation as projection on db.Designation;
    entity Salary as projection on db.Salary;
}