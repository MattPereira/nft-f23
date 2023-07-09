// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {DeployMoodNft} from "../../script/DeployMoodNft.s.sol";
import {MoodNft} from "../../src/MoodNft.sol";

contract DeployMoodNftTest is Test {
    DeployMoodNft public deployer;

    function setUp() public {
        deployer = new DeployMoodNft();
    }

    function testConvertSvgToUri() public {
        string
            memory expectedUri = "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI0MDAiIGhlaWdodD0iNDAwIj48dGV4dCB4PSIwIiB5PSIxNSIgZmlsbD0iYmxhY2siPiBoaSEgeW91ciBicm93c2VyIGRlY29kZWQgdGhpcyEgPC90ZXh0Pjwvc3ZnPg==";
        string
            memory svg = '<svg xmlns="http://www.w3.org/2000/svg" width="400" height="400"><text x="0" y="15" fill="black"> hi! your browser decoded this! </text></svg>';
        string memory actualUri = deployer.svgToImageURI(svg);

        assertEq(
            keccak256(abi.encodePacked(actualUri)),
            keccak256(abi.encodePacked(expectedUri))
        );
    }
}
