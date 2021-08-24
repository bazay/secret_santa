# SecretSanta

## Installation

First, download the project locally
```bash
git clone git@github.com:bazay/secret_santa.git
cd secret_santa/
```

Run setup script to install dependencies
```bash
bin/setup
```

## Usage

```bash
bin/runner path/to/file.csv
```

For example, try:
```bash
bin/runner ./spec/files/group1.csv
bin/runner ./spec/files/group2.csv
```

## Expected outputs

### Success
`./spec/files/group1.csv`
```bash
$ bin/runner ./spec/files/group1.csv
User 'Chris' with email 'chris@example.com'
  - giving_to: andre@example.fr
User 'Felix' with email 'felix@example.net'
  - giving_to: olive99@example.net
User 'Elizabeth' with email 'lizzy1994@example.com'
  - giving_to: hugo124@example.net
User 'André' with email 'andre@example.fr'
  - giving_to: felix@example.net
User 'Milo' with email 'milo.milo@example.com'
  - giving_to: amit.123@example.com
User 'Olivia' with email 'olive99@example.net'
  - giving_to: ludwig@example.net
User 'Hugo' with email 'hugo124@example.net'
  - giving_to: milo.milo@example.com
User 'Amit' with email 'amit.123@example.com'
  - giving_to: raoul@example.com
User 'Ludwig' with email 'ludwig@example.net'
  - giving_to: chris@example.com
User 'Raoul' with email 'raoul@example.com'
  - giving_to: lizzy1994@example.com
```

`./spec/files/group2.csv`
```bash
$ bin/runner ./spec/files/group2.csv
User 'Kirk' with email 'j.t.kirk@starfleet.example.com'
  - giving_to: l.mccoy@starfleet.example.com
User 'Spock' with email 's.t.spock@@starfleet.example.com'
  - giving_to: j.t.kirk@starfleet.example.com
User 'McCoy' with email 'l.mccoy@starfleet.example.com'
  - giving_to: s.t.spock@@starfleet.example.com
```

# Failure
```bash
$ bin/runner ./spec/files/group1.csv
Failed to find matches within 10 attempts. Please try again
```
