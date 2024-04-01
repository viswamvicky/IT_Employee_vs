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
  address         : Association to Address; 
}

entity Address : cuid {
  city     : String not null;
  address  : String not null;
  pincode  : Integer not null;
  street   : String;
  landmark : String;
}
