# API provider

an API provider for the backend of Ad-Creator application built on Cucumber and RSpec on BDD.

## Requirements

  - `Ruby 2.3.0`
  - `Rails 5.0.1`

## Backgrond

To practice building an API provider as well as getting used to BDD using Cucmber and RSpec. 

## Features

  * Users are able to create ads containing a title, a description and a price.
  * Users can make an offer to an existing ad, with a message and a price which can be different.
  * The client can retrieve all existing ads.
  * The client can retrieve an ad with its corresponding offers, sorted by price.

## Usage

### Ads

Queries all the ads in the database.

`GET '/ads'`

Creates an ad. Required parameteres are the title, description, price and the creating user's id.

`POST '/ads?title=this_is_the_title&price=1000&description=this_is_the_description&user_id=1'`

### Offers

Queries all the offers for existing ads. The example queries the offer for the ad id of 1.

`GET '/ads/1/offers'`

Creates an offer. Required parameteres are the associated ad_id, message, title, price and the user_id.

`POST '/ads?title=this_is_the_title&price=1000&description=this_is_the_description&user_id=1'`



