Feature: List full urls from a Debian/Ubuntu repo
  In order to have the packages' info of a specific Debian/Ubuntu repotory
  As a developer
  I want to get all the urls for the remote Package.gz files

  @urls @components
  Scenario: URL for a repo with one component
    Given a repo with url "http://us.archive.ubuntu.com/ubuntu"
    And which suite is "oneiric"
    And one single component called "main"
    When ask for the full url
    Then I should get "http://us.archive.ubuntu.com/ubuntu/dists/oneiric/main/binary-i386/Packages.gz"

  @urls @components
  Scenario: URL for a repo with two component
    Given a repo with url "http://us.archive.ubuntu.com/ubuntu"
    And which suite is "oneiric"
    And two components called "main" and "universe"
    When ask for the full url
    Then I should get "http://us.archive.ubuntu.com/ubuntu/dists/oneiric/main/binary-i386/Packages.gz"
    And "http://us.archive.ubuntu.com/ubuntu/dists/oneiric/universe/binary-i386/Packages.gz"

  @urls @suites
  Scenario: URL for a repo with two suites and one component
    Given a repo with url "http://us.archive.ubuntu.com/ubuntu"
    And which suites are "oneiric" and "oneiric-updates"
    And one single component called "main"
    When ask for the full url
    Then I should get "http://us.archive.ubuntu.com/ubuntu/dists/oneiric/main/binary-i386/Packages.gz"

  @urls @suites
  Scenario: URL for a repo with two suites and two component
    Given a repo with url "http://us.archive.ubuntu.com/ubuntu"
    And which suites are "oneiric" and "oneiric-updates"
    And two components called "main" and "universe"
    When ask for the full url
    Then I should get "http://us.archive.ubuntu.com/ubuntu/dists/oneiric/main/binary-i386/Packages.gz"
    And "http://us.archive.ubuntu.com/ubuntu/dists/oneiric/universe/binary-i386/Packages.gz"
    And "http://us.archive.ubuntu.com/ubuntu/dists/oneiric-updates/main/binary-i386/Packages.gz"
    And "http://us.archive.ubuntu.com/ubuntu/dists/oneiric-updates/universe/binary-i386/Packages.gz"

  @urls @altogether
  Scenario: URL for a repo with two suites and one component as arguments
    Given a repo with url "http://us.archive.ubuntu.com/ubuntu", a suite "oneiric" and a component called "main" altogether
    When ask for the full url
    Then I should get "http://us.archive.ubuntu.com/ubuntu/dists/oneiric/main/binary-i386/Packages.gz"

  @urls @altogether
  Scenario: URL for a repo with two suites and two component as arguments
    Given a repo with url "http://us.archive.ubuntu.com/ubuntu", a suites "oneiric" and "oneiric-updates" and two components called "main" and "universe" altogether
    When ask for the full url
    Then I should get "http://us.archive.ubuntu.com/ubuntu/dists/oneiric/main/binary-i386/Packages.gz"
    And "http://us.archive.ubuntu.com/ubuntu/dists/oneiric/universe/binary-i386/Packages.gz"
    And "http://us.archive.ubuntu.com/ubuntu/dists/oneiric-updates/main/binary-i386/Packages.gz"
    And "http://us.archive.ubuntu.com/ubuntu/dists/oneiric-updates/universe/binary-i386/Packages.gz"
