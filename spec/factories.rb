Factory.define :user do |f|
  f.sequence(:email) { |n| "foo#{n}@example.com" }
  f.passord 'secret'
end