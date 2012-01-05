Feature: List packages from a Debian/Ubuntu repo
  In order to know all the packages availables from specific Debian/Ubuntu repository
  As a developer
  I want to extract all the names with its descriptions from the remote Package.gz files


  @packages @not_found
  Scenario: The remote file is not found
    Given a bad url "http://us.archive.ubuntu.com/ubuntu/dists/oniric/main/binary-i386/Packages.gz"
    When ask for a list of packages
    Then I should get a empty list

  @packages @names @descriptions
  Scenario: List of package names and descriptions
    Given a Packages.gz file with url "http://us.archive.ubuntu.com/ubuntu/dists/oneiric/main/binary-i386/Packages.gz"
    When ask for a list of packages
    Then I should get a list of pairs: name and description

  @packages @package_exist
  Scenario Outline: List of packages that exits
    Given a Packages.gz file with url "http://us.archive.ubuntu.com/ubuntu/dists/oneiric/main/binary-i386/Packages.gz"
    When ask for a list of packages
    Then the list should include "<package>" with description "<description>"

    Examples:
        | package     | description                                         |
        | libc6       | Embedded GNU C Library: Shared libraries            |
        | xdg-utils   | desktop integration utilities from freedesktop.org  |
        | klibc-utils | small utilities built with klibc for early boot     |
