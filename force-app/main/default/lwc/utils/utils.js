//////////////////////
/// Enums
//////////////////////

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

const ProjectStatusEnum = Object.freeze({
    IN_DEVELOPMENT : { value: "IN_DEVELOPMENT" },
    PUBLISHED : { value: "PUBLISHED"},
    DELETED : { value: "DELETED"}
})

const UseCaseStatusEnum = Object.freeze({
    IN_DEVELOPMENT : { value: "IN_DEVELOPMENT" },
    PUBLISHED : { value: "PUBLISHED"},
    DELETED : { value: "DELETED"}
})


//////////////////////
/// Utility functions
//////////////////////

function isBlankString( str ) {
    return ( !str || str.trim().length === 0 );
}

function isEmptyNumber( number ) {
    return !number;
}


//////////////////////
/// Utility constants
//////////////////////

const EMPTY_STRING = "";


export { TreeItemEnum, PriorityItemEnum, ProjectStatusEnum, UseCaseStatusEnum, isBlankString, isEmptyNumber, EMPTY_STRING };