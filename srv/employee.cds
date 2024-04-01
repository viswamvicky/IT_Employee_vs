using employee.details as db from '../db/Dep';

@path: '/EmployeeSRV'
service EmployeeService {
    entity Employee as projection on db.Employee;
    entity Address as projection on db.Address;
}