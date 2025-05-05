// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Base Contract
contract Vehicle {
    string public make;
    string public model;
    uint public year;
    string public fuelType;

    constructor(string memory _make, string memory _model, uint _year, string memory _fuelType) {
        make = _make;
        model = _model;
        year = _year;
        fuelType = _fuelType;
    }

    // Virtual function to calculate fuel efficiency (km per litre)
    function calculateFuelEfficiency(uint fuelConsumedLitres, uint distanceKm) public pure virtual returns (uint) {
        require(fuelConsumedLitres > 0, "Fuel must be greater than 0");
        return distanceKm / fuelConsumedLitres;
    }

    // Virtual function to calculate distance
    function calculateDistance(uint speedKmph, uint timeHours) public pure virtual returns (uint) {
        return speedKmph * timeHours;
    }

    // Virtual function to return max speed
    function maxSpeed() public pure virtual returns (uint) {
        return 0; // Placeholder to be overridden
    }
}

// Truck Contract
contract Truck is Vehicle {
    constructor(string memory _make, string memory _model, uint _year, string memory _fuelType)
        Vehicle(_make, _model, _year, _fuelType) {}

    function maxSpeed() public pure override returns (uint) {
        return 120; // km/h
    }
}

// Car Contract
contract Car is Vehicle {
    constructor(string memory _make, string memory _model, uint _year, string memory _fuelType)
        Vehicle(_make, _model, _year, _fuelType) {}

    function maxSpeed() public pure override returns (uint) {
        return 200; // km/h
    }
}

// Motorcycle Contract
contract Motorcycle is Vehicle {
    constructor(string memory _make, string memory _model, uint _year, string memory _fuelType)
        Vehicle(_make, _model, _year, _fuelType) {}

    function maxSpeed() public pure override returns (uint) {
        return 180; // km/h
    }
}


/// @title Shape Hierarchy: Circle, Rectangle, Triangle
/// @notice Demonstrates inheritance and method overriding in Solidity

// Base abstract contract
abstract contract Shape {
    function getArea() public view virtual returns (uint);
    function getPerimeter() public view virtual returns (uint);
}

// Circle contract
contract Circle is Shape {
    uint public radius;

    constructor(uint _radius) {
        radius = _radius;
    }

    // π ≈ 3.14, scaled as 314 (×100 to avoid float)
    function getArea() public view override returns (uint) {
        return (314 * radius * radius) / 100;
    }

    // 2πr ≈ 6.28, scaled as 628 (×100)
    function getPerimeter() public view override returns (uint) {
        return (628 * radius) / 100;
    }
}

// Rectangle contract
contract Rectangle is Shape {
    uint public length;
    uint public width;

    constructor(uint _length, uint _width) {
        length = _length;
        width = _width;
    }

    function getArea() public view override returns (uint) {
        return length * width;
    }

    function getPerimeter() public view override returns (uint) {
        return 2 * (length + width);
    }
}

// Triangle contract (base = a, height is separate)
contract Triangle is Shape {
    uint public a;
    uint public b;
    uint public c;
    uint public height; // Height relative to base 'a'

    constructor(uint _a, uint _b, uint _c, uint _height) {
        a = _a;
        b = _b;
        c = _c;
        height = _height;
    }

    function getArea() public view override returns (uint) {
        return (a * height) / 2;
    }

    function getPerimeter() public view override returns (uint) {
        return a + b + c;
    }
}

