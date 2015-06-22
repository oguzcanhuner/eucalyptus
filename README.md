# eucalyptus

An easy interface and abstraction to the Facebook Ads API.

![alt text](http://public.media.smithsonianmag.com/legacy_blog/eucalyptus-gold.jpg "Eucalyptus")

## Installation

`gem install eucalyptus`

or stick this in your gemfile:

`gem 'eucalyptus'`

You then need to grab yourself an access token from facebook and initialize Eucalyptus with it:

```
Eucalyptus.configure do |config|
  config.access_token = YOUR_ACCESS_TOKEN
end
```

And you're all set to go!

## Usage

```
account = Eucalyptus::Account.all.last
campaign = account.campaigns.first

campaign.name

account_ads = account.ads
campaign_ads = campaign.ads

insights = campaign.insights
insights.cpa

ads = Add.all

ads == account_ads
```

## Contributing to eucalyptus
 
- Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
- Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
- Fork the project.
- Start a feature/bugfix branch.
- Commit and push until you are happy with your contribution.
- Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.

## Copyright

Copyright (c) 2015 Oguz Huner. See LICENSE.txt for
further details.

