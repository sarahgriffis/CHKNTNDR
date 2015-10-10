Rails.application.config.middleware.use OmniAuth::Builder do
  provider :linkedin, ENV['LINKEDIN_KEY'], ENV['LINKEDIN_SECRET'],
    :scope => 'r_basicprofile, r_emailaddress',
    :fields => ['id', 'email-address', 'first-name', 'last-name', 'headline', 'location',
                'industry', 'picture-url', 'public-profile-url', 'num-connections', 'summary',
                'positions', 'interests', 'date-of-birth', 'connections']
end
