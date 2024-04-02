namespace employee.details;

using reuse from './reuse';
using {
  cuid,
  managed
} from '@sap/cds/common';


@assert.unique: {
  email: [email],
  phone: [phone]
}

entity Employee : cuid, managed {
  fName           : String;
  lName           : String;
  gender          : String;
  DOB             : Date;
  contractStarted : Date;
  email           : reuse.Email not null; // This Email has to follow the Format and shuld not be null
  phone           : reuse.PhoneNumber not null;
  address         : Composition of many Address
                      on address.employee = $self;
  salary          : Composition of Salary
                      on salary.employee = $self;
  designation     : Composition of Designation
                      on designation.employee = $self;
  department      : Association to Department on department.employee = $self;
}

entity Address : cuid {
  city     : String not null;
  address  : String not null;
  pincode  : Integer not null;
  street   : String;
  landmark : String;
  employee : Association to Employee;
}

entity Salary : cuid {
  costToCompany : reuse.Amount;
  employeePf    : reuse.Amount;
  employerPf    : reuse.Amount;
  nps           : reuse.Amount;
  vpf           : reuse.Amount;
  employee      : Association to Employee;
}

entity Designation : cuid {
  name        : String;
  description : String;
  level       : String;
  employee    : Association to Employee;
}

entity Department : cuid {
  name        : String;
  description : String;
  headCount   : Integer;
  employee : Association to Employee;
}
