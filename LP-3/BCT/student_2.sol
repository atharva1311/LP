//SPDX-License-Identifier: Unlicensed

//This line specifies the version of the Solidity compiler that should be used. In this case, it mandates a minimum version of Solidity 0.8.0.
pragma solidity >=0.8.0;

//This defines the main smart contract named "Student."
contract Student {

    //This struct represents the structure of a student record and has the following fields:
    struct student {

        uint256 prn; //prn: A uint256 (unsigned integer) to store the student's PRN (Prescription Registration Number).
        string name; // A string to store the student's name.
        string class; //A string to store the student's class.
        string department; // A string to store the student's department.

    }
    uint256 PRN; //This variable is used to keep track of the PRN (Prescription Registration Number). It starts at 0.

    //This mapping associates PRN values with student records. It maps PRN (an unsigned integer) to a "student" struct.
    mapping(uint256 => student) studentMap;

    //This function is used to add a new student to the "studentMap."
    //It takes three string parameters: name, class, and department.
    function addStudent(
        string memory name,
        string memory class,
        string memory department
    ) public {

        PRN += 1; //It increments the PRN value and creates a new student record with the provided data.
        studentMap[PRN] = student(PRN, name, class, department);

    }

    //This function allows you to retrieve a student's record by specifying their PRN (_id).
    //It returns a "student" struct as a result.

    function getStudent(uint256 _id) public view returns (student memory) {
        return studentMap[_id];
    }

    //This function returns the total number of students that have been added (the current PRN value).
    function totalStudents() public view returns (uint256) {
        return (PRN);
    }


    //The fallback function is executed when a user interacts with the contract but doesn't specify a valid function to call.
    //In this case, it adds a default student record with the name "Unknown," class "FE," and department "CSE."

    fallback() external {
        addStudent("Unknown", "FE", "CSE");
    }
}
