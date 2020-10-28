pragma solidity ^0.5.0;

// lvl 1: equal split
contract AssociateProfitSplitter {
    // @TODO: Create three payable addresses representing `employee_one`, `employee_two` and `employee_three`.
    address payable employee_one;
    address payable employee_two;
    address payable employee_three;
    address hr_address;
    //address public sender_address;
    //address public contract_address;

    constructor(address payable _one, address payable _two, address payable _three) public {
        employee_one = _one;
        employee_two = _two;
        employee_three = _three;
        hr_address = msg.sender;
        
    }

    function balance() public view returns(uint) {
        return address(this).balance;
    }

    function deposit() public payable {
        
        //sender_address = msg.sender;
        //contract_address = address(this);
        require(msg.sender == hr_address, "Only the HR can call this function!");
        // @TODO: Split `msg.value` into three
        uint amount = msg.value / 3; // Your code here!

        // @TODO: Transfer the amount to each employee
        // Your code here!
        employee_one.transfer(amount);
        employee_two.transfer(amount);
        employee_three.transfer(amount);

        // @TODO: take care of a potential remainder by sending back to HR (`msg.sender`)
        // Your code here!
        msg.sender.transfer(msg.value - (amount * 3));
    }

    function() external payable {
        // @TODO: Enforce that the `deposit` function is called in the fallback function!
        // Your code here!
        deposit();
    }
}
