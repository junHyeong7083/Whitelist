// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract Whitelist
{
    /*
        < 필요한 변수 >
    1. 승인된 사람의 지갑주소
    2. 화이트리스트 등록 인원수
    3. 키-밸류 형식의 자료구조를 사용해야함   mapping (address => bool) public WhitelistAddresses;
    */

   // 최대 허용가능한 화이트리스트 수
   uint8 public maxWhitelistAddresses; 
   
   // 화이트리스트에 등록된 지갑 주소( 화이트리스트 등록시 true )
   mapping(address => bool) public WhitelistAddresses; 

   // 실제 화이트리스트에 등록한 지갑 수
    uint8 public numAddressesWhitelisted;

    // 이 화이트리스트 컨트랙트가 실행될때 함께 실행되는 생성자 함수
    constructor(uint8 _maxWhitelistAddresses)
    {
        maxWhitelistAddresses = _maxWhitelistAddresses;
    }

    function addAddressToWhitelist() public  
    {
        // 특정 지갑이 화이트리스트에 이미 등록이 되어있는지 확인
        require(!WhitelistAddresses[msg.sender], "You are already Whitelisted");

        // 허용 가능한 최대 인원수보다 더많은 사람들이 화이트리스테 등록하려 할떄
        require(numAddressesWhitelisted < maxWhitelistAddresses, "More addresses cant be added, limit reached");
    
        // 화이트리스트에 등록시킬 주소를 맵에 추가, 키는 지갑주소, 값은 true || false
        WhitelistAddresses[msg.sender] = true;

        // 등록된 지갑수 +1
        numAddressesWhitelisted ++;
    
    }

}