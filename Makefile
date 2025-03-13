-include .env

.PHONY: all test deploy

build :; forge build

test :; forge test

install :; forge install cyfrin/foundry-devops@0.2.2 && forge install smartcontractkit/chainlink-brownie-contracts@1.1.1 && forge install foundry-rs/forge-std@v.1.8.2 @@ forge install transimission11/solmate@v6 --no-commit


deploy-sepolia :
	@forge script script/DeployRaffle.s.sol:RaffleDeploy --rpc-url ${SEPOLIA_RPC_URL} --account default --broadcast --verify --etherscan-api-key ${ETHERSCAN_API_KEY} -vvvv