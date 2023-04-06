module github.com/ethstorage/zk-decoder/golang

go 1.17

require (
	github.com/iden3/go-iden3-crypto v0.0.14
	golang.org/x/crypto v0.7.0
)

require golang.org/x/sys v0.6.0 // indirect

replace github.com/iden3/go-iden3-crypto => github.com/ethstorage/go-iden3-crypto v0.0.0-20230406080944-d89aec086425
