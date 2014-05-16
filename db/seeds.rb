# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create([
  {
    name: "Taylor Smith",
    email: "taylor@themakersquare.com"
  },
  {
    name: "Mike Ornellas",
    email: "mike@themakersquare.com"
  }
  ])

Video.create([
  {
    title: "Pacific Rim",
    description: "Giant robots fighting giant sea monsters",
    youtube_id: "SSNU6t0pmkw",
    user_id: 2
  },
  {
    title: "Frozen",
    description: "Cold 3D Animation",
    youtube_id: "FLzfXQSPBOg",
    user_id: 1
  }
  ])

vid1 = Video.create({
    title: "Gladiator",
    description: "A great movie",
    youtube_id: "rNdKBPcVGJI",
    user_id: 1
  })


# better way to create it like this, use the ActiveRecord associations

# Comment.create({video_id: vid1.id, content: "cool"})
vid1.comments.create({content: "awesome!"})

Sound.create([
  {
    title: "Cool sound",
    soundclound_url: "https://soundcloud.com/makersquare/files"
  },
  {
    title: "Awesome music",
    soundclound_url: "https://soundcloud.com/makersquare/sitcom-don"
  }
  ])

vid1 = Video.create({
    title: "Gladiator",
    description: "A great movie",
    youtube_id: "rNdKBPcVGJI",
    user_id: 1
  })



user1= User.create(
  {
    name: "Hubert ",
    email: "hubert@mail.com"
  }
  )

comment1 = Comment.create(:user_id => 1, :commentable_type=>"Sound", :commentable_id=> 1)
comment1 = Comment.create(:user_id => 1, :commentable_type=>"Video", :commentable_id=> 1)













