import "MetadataViews"
import "ExampleNFT"

transaction {

    prepare(signer: auth(Storage, Capabilities) &Account) {
        // Use the caller's address
        let address: Address = signer.address

        // Borrow the NFTMinter from the caller's storage
        let minter = signer.storage.borrow<&ExampleNFT.NFTMinter>(
            from: /storage/exampleNFTMinter
        ) ?? panic("Could not borrow the NFT minter reference.")

        // Mint a new NFT with metadata
        let nft <- minter.mintNFT(
            name: "Example NFT",
            description: "Minting a sample NFT",
            thumbnail: "https://example.com/thumbnail.png",
            royalties: [],
            metadata: {
                "Power": "100",
                "Will": "Strong",
                "Determination": "Unyielding"
            },
            
        )

        // Borrow the collection from the caller's storage
        let collection = signer.storage.borrow<&ExampleNFT.Collection>(
            from: /storage/exampleNFTCollection
        ) ?? panic("Could not borrow the NFT collection reference.")

        // Deposit the newly minted NFT into the caller's collection
        collection.deposit(token: <-nft)
    }
}
