Feature: List packages from a Debian/Ubuntu repo
  In order to know all the packages availables from specific Debian/Ubuntu repository
  As a developer
  I want to extract all the names with its descriptions from the remote Package.gz files

  @packages @names
  Scenario: List of package names
    Given a Packages.gz file with url "http://us.archive.ubuntu.com/ubuntu/dists/oneiric/main/binary-i386/Packages.gz"
    When ask for a list of packages
    Then I should get a list of stings

  @packages @package_exist
  Scenario Outline: List of packages that exits
    Given a Packages.gz file with url "http://us.archive.ubuntu.com/ubuntu/dists/oneiric/main/binary-i386/Packages.gz"
    When ask for a list of packages
    Then the list should include "<package>"

    Examples:
        | package     |
        | libc6       |
        | xdg-utils   |
        | klibc-utils |
