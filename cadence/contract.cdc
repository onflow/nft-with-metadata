access(all)
resource NFT: NonFungibleToken.INFT, MetadataViews.Resolver {
    access(all)
    let id: UInt64

    access(all)
    let name: String
    access(all)
    let thumbnail: String
    access(all)
    let description: String
    access(all)
    let power: String
    access(all)
    let will: String
    access(all)
    let determination: String

    access(all)
    fun getViews(): [Type] {
        return [
            Type<MetadataViews.Display>(),
            Type<NewExampleNFT.Traits>()
        ]
    }

    access(all)
    fun resolveView(_ view: Type): AnyStruct? {
        switch view {
            case Type<MetadataViews.Display>():
                return MetadataViews.Display(
                    name: self.name,
                    description: self.description,
                    thumbnail: MetadataViews.HTTPFile(
                        url: self.thumbnail
                    )
                )
            case Type<NewExampleNFT.Traits>():
                return NewExampleNFT.Traits(
                    power: self.power,
                    will: self.will,
                    determination: self.determination
                )
        }

        return nil
    }

    init(
        id: UInt64,
        name: String,
        description: String,
        thumbnail: String,
        power: String,
        will: String,
        determination: String
    ) {
        self.id = id
        self.name = name
        self.thumbnail = thumbnail
        self.description = description
        self.power = power
        self.will = will
        self.determination = determination
    }
}
