Feature: List packages from a Debian/Ubuntu repo
  In order to know all the packages availables from specific Debian/Ubuntu repository
  As a developer
  I want to extract all the names with its descriptions from the remote Package.gz files
  but I want the descriptions in my languages, if they are availables. It is, the proper
  Translation-??.gz for the language I choose.
  If there are no translation I want the original description.


  @packages @not_found
  Scenario: The remote file is not found
    Given a bad url "http://us.archive.ubuntu.com/ubuntu/dists/oniric/main/binary-i386/Packages.gz"
    When ask for a list of packages
    Then I should get a empty list

  @packages @names @descriptions
  Scenario: List of package names and descriptions
    Given a Packages.gz file with url "http://us.archive.ubuntu.com/ubuntu/dists/oneiric/main/binary-i386/Packages.gz"
    But no Translations' url file
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

  @packages @descriptions @translations @es
  Scenario Outline: List of package names and the Spanish descriptions
    Given a Packages.gz file with url "http://us.archive.ubuntu.com/ubuntu/dists/oneiric/main/binary-i386/Packages.gz"
    And a Translations-es.gz file with url "http://us.archive.ubuntu.com/ubuntu/dists/oneiric/main/i18n/Translation-es.gz"
    When ask for a list of packages
    Then the list should include "<package>" with description "<description>"

    Examples:
        | package     | description                                                     |
        | libc6       | Biblioteca empotrada GNU C: Bibliotecas compartidas             |
        | xdg-utils   | Utilidades de integración en el escritorio de freedesktop.org   |
        | klibc-utils | Pequeñas utilidades generadas con klibc para un arranque rápido |

  @packages @descriptions @translations @it
  Scenario Outline: List of package names and the Italian descriptions
    Given a Packages.gz file with url "http://us.archive.ubuntu.com/ubuntu/dists/oneiric/main/binary-i386/Packages.gz"
    And a Translations-it.gz file with url "http://us.archive.ubuntu.com/ubuntu/dists/oneiric/main/i18n/Translation-it.gz"
    When ask for a list of packages
    Then the list should include "<package>" with description "<description>"

    Examples:
        | package     | description                                                          |
        | libc6       | libreria C GNU embedded: librerie condivise                          |
        | xdg-utils   | strumenti per l'integrazione col desktop da freedesktop.org          |
        | klibc-utils | piccole utilità compilate con klibc per le fasi iniziali dell'avvio  |
