
const TreeItemEnum = Object.freeze( { 
    PROJECT : { value: "Project" },
    USECASE : { value: "UseCase"} 
});

const PriorityItemEnum = Object.freeze( {
    MINOR : { value: "MINOR" },
    NORMAL : { value: "NORMAL" },
    MAJOR : { value: "MAJOR"},
    CRITICAL : { value: "CRITICAL" }
});

const ItemStatusEnum = Object.freeze({
    IN_DEVELOPMENT : { value: "IN_DEVELOPMENT" },
    PUBLISHED : { value: "PUBLISHED"}
})

export { TreeItemEnum, PriorityItemEnum, ItemStatusEnum };
