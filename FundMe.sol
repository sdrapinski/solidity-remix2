// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract FundMe {
    uint256 public minimumUsd = 5e18;

    address[] public funders;
    mapping(address funder => uint256 amountFunded)
        public addressToAmountfunded;

    function fund() public payable {
        require(
            getConversionRate(msg.value) >= minimumUsd,
            "didnt send enough ETH"
        ); //1e18 = 1ETH
        funders.push(msg.sender);
        addressToAmountfunded[msg.sender] =
            addressToAmountfunded[msg.sender] +
            msg.value;
    }

    function getPrice() public view returns (uint256) {
        //address 0x694AA1769357215DE4FAC081bf1f309aDC325306
        //abi

        AggregatorV3Interface priceFeed = AggregatorV3Interface(
            0x694AA1769357215DE4FAC081bf1f309aDC325306
        );
        (, int256 price, , , ) = priceFeed.latestRoundData();

        return uint256(price * 1e10);
    }

    function getConversionRate(
        uint256 ethAmount
    ) public view returns (uint256) {
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;
        return ethAmountInUsd;
    }

    function getVerions() public view returns (uint256) {
        return
            AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306)
                .version();
    }
}
