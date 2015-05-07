Feature: Get current repository status
    Most of git we could use from the old git binary commands, however
    In order to customize our command prompts,
    The one thing we absolutely must have as objects is the status
    The command name will get Get-GitStatus

    # This is a freebie, so that there's something not @wip
    Scenario: There's no Repository
        Given we are NOT in a repository
        When Get-GitStatus is called
        Then the output should be: "The path is not in a git repository!"

    @wip
    Scenario: Empty Repository
        Given we have initialized a repository
        When Get-GitStatus is called
        Then the output should have
            | Property | Value             |
            | Branch   | master            |
            | Summary  | Nothing to commit |
            | Note     | Initial Commit    |

    @wip
    Scenario: New Files in Repository
        Given we have initialized a repository
        And adding 3 files
        When Get-GitStatus is called
        Then the output should have
            | Property | Value             |
            | Branch   | master            |
            | Summary  | Nothing to commit |
            | Note     | Initial Commit    |
        And the count of changes should be
            | State     | Count |
            | Untracked | 3     |
        And the 3 untracked file names should be available

    @wip
    Scenario: Added Files to Stage
        Given we have initialized a repository
        And adding 3 files
        When Add-GitItem * is called
        When Get-GitStatus is called
        Then the output should have
            | Property | Value             |
            | Branch   | master            |
            | Summary  | Nothing to commit |
            | Note     | Initial Commit    |
        And the count of changes should be
            | State | Count |
            | Added | 3     |
        And the 3 added file names should be available

    @wip
    Scenario: Added and Modified Files
        Given we have initialized a repository
        And adding 3 files
        When Add-GitItem * is called
        And 2 files are edited
        When Get-GitStatus is called
        Then the output should have
            | Property | Value             |
            | Branch   | master            |
            | Summary  | Nothing to commit |
            | Note     | Initial Commit    |
        And the count of changes should be
            | State    | Count |
            | Added    | 3     |
            | Modified | 2     |
        And the 3 added file names should be available
        And the 2 modified file names should be available