public with sharing class PriorityUtils {

    private PriorityUtils() {
    }

    public static Priority valueOf( final String priorityStr ) {

        switch on priorityStr {
            when 'MINOR' {
                return Priority.MINOR;
            }
            when 'NORMAL' {
                return Priority.NORMAL;
            }
            when 'MAJOR' {
                return Priority.MAJOR;
            }
            when 'CRITICAL' {
                return Priority.CRITICAL;
            }
            when else {
                throw new NotFoundException( 'Priority enum value cant be constructed by:' + priorityStr );
            }
        }
    }
}
