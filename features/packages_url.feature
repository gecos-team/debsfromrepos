Feature: List full urls from a Debian/Ubuntu repo
  In order to have the packages' info of a specific Debian/Ubuntu repotory
  As a developer
  I want to get the url for the remote Package.gz file

  @url
  Scenario: URL for a repo
    Given a repo with url "http://us.archive.ubuntu.com/ubuntu"
    And which suite is "oneiric"
    And one single component called "main"
    When ask for the full url
    Then I should get "http://us.archive.ubuntu.com/ubuntu/dists/oneiric/main/binary-i386/Packages.gz"

  @url @bad_url
  Scenario: URL for a repo with a missing suite
    Given a repo with url "http://us.archive.ubuntu.com/ubuntu"
    And one single component called "main"
    When ask for the full url
    Then I should get nil
    And I should get an error message: "ERROR: the suite was missing"

  @url @bad_url
  Scenario: URL for a repo with a missing component
    Given a repo with url "http://us.archive.ubuntu.com/ubuntu"
    And which suite is "oneiric"
    When ask for the full url
    Then I should get nil
    And I should get an error message: "ERROR: the component was missing"

  @url @bad_url
  Scenario Outline: URL for a repo with a wrong base url
    Given a repo with url "<url>"
    And which suite is "oneiric"
    And one single component called "main"
    When ask for the full url
    Then I should get nil
    And I should get an error message: "ERROR: the url format is wrong"

    Examples:
        | url                                   |
        | htp://us.archive.ubuntu.com/ubuntu    |
        | http:/us.archive.ubuntu.com/ubuntu    |
        | http//us.archive.ubuntu.com/ubuntu    |

  @url @altogether
  Scenario: URL for a repo with the suite and the component passed as arguments
    Given a repo with url "http://us.archive.ubuntu.com/ubuntu", a suite "oneiric" and a component called "main" altogether
    When ask for the full url
    Then I should get "http://us.archive.ubuntu.com/ubuntu/dists/oneiric/main/binary-i386/Packages.gz"
