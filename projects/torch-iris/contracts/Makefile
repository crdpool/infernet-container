# phony targets are targets that don't actually create a file
.phony: deploy call-contract

# anvil's third default address
sender := 0x3b70aa04c3ec44a88ef29d0f45f2aa065ef2da2137e80d24c81610d2bca0a923
RPC_URL := https://mainnet.base.org/

# deploying the contract
deploy:
	@PRIVATE_KEY=$(sender) forge script script/Deploy.s.sol:Deploy --broadcast --rpc-url $(RPC_URL)

# calling sayGM()
call-contract:
	@PRIVATE_KEY=$(sender) forge script script/CallContract.s.sol:CallContract --broadcast --rpc-url $(RPC_URL)
