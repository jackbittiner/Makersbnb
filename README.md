MakersBnB!

![Screenshot](http://imgur.com/jciL2bD)
=================

Allows user to both list and book holiday destinations:

- User may list any number of spaces
- User can update spaces they have listed

- User can request to book any space they choose (not listed by them) for one night
- User can accept or reject requests for their space to be reserved
- Spaces cannot be booked twice for the same night

-------

To use MakersBnB, 

```
$ git clone git@github.com:jackbittiner/Makersbnb.git
$ bundle
$ bundle update
```

In Postgresql, run the following command:

```
$ create database makersbnb_development
```

Run the following commands:
```
$ rake auto_migrate
$ rspec
$ rackup
```

Navigate to 'localhost9292/'. The login page should display as follows:

![Screenshot](http://imgur.com/jc6Yw0M)

Once signed in, MakersBnB can be used to list and request spaces!
