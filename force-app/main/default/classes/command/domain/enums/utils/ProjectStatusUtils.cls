public with sharing class ProjectStatusUtils {

    private ProjectStatusUtils() {
    }

    public static ProjectStatus valueOf( final String projectStatusStr ){

        switch on projectStatusStr {
            when 'IN_DEVELOPMENT' {
                return ProjectStatus.IN_DEVELOPMENT;
            }
            when 'PUBLISHED' {
                return ProjectStatus.PUBLISHED;
            }
            when else {
                throw new NotFoundException( 'ProjectStatus enum value cant be constructed by:' + projectStatusStr );
            }
        }
    }
}
