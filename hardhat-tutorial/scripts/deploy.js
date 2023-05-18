const { ethers } = require("hardhat"); 
// 구조분해할당(destructring assignment) 문법을 사용해서,
// hardhat 내부에 있는 ethers를 뽑아오고, 뽑아온 ethers를 변수 ethers에 할당

// 스마트컨트랙트를 블록체인상에 베포할 때 실행될 메인 함수
async function main()
{
  // ethers 에서 제공해주는 스마트컨트랙트 베포할 때 쓰는 함수인 getContractFactory를 사용해서
  // 스마트 컨트랙트를 메모리상에 올림(인스턴스화)
  const whitelistContract = await ethers.getContractFactory("Whitelist");

  // 실제 베포하는 함수 실행(deploy) 이떄 생성자 함수에 넘겨줄 값도 같이 입력
  const depolyedWhitelistContract = await whitelistContract.deploy(10);

  // 스컨이 베포될때까지 대기
  await depolyedWhitelistContract.deployed();

  // 베포가 완료되면 로그창에 "white contract address : 스마트컨트랙트주소" 출력
  console.log("white contract address : ",depolyedWhitelistContract.address);
}




// 위에서 선언한 main()함수 실행
main()
.then(() => process.exit(0)) // 이 함수가 정상적으로 실행되면 프로세스 정상종료(exit(0))
.catch((err) =>              // 함수실행중 에러가 나타나면 콘솔창에 에러출력후 프로세스 비정상종료(exit(1))
 { 
    console.error(error);
    process.exit(1);
 }
);