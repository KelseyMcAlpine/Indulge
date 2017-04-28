# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Order.create ([
  {
    purchase_date: DateTime.new(2009,9,1,17),
    status: "pending",
    cust_email: "acb@sample.com",
    cust_address: "123 happy lane, road road, WA 98123",
    credit_card: 1111,
    cc_expire: DateTime.new(2020, 6, 22)
  },
  {
    purchase_date: DateTime.new(2010,9,1,17),
    status: "pending",
    cust_email: "dce@sample.com",
    cust_address: "123 happy lane, road road, WA 98123",
    credit_card: 4321,
    cc_expire: DateTime.new(2019, 6, 22)
  },
  {
    purchase_date: DateTime.new(2010,9,1,17),
    status: "completed",
    cust_email: "acb@sample.com",
    cust_address: "123 happy lane, road road, WA 98123",
    credit_card: 1234,
    cc_expire: DateTime.new(2019, 6, 22)
  },
  {
    purchase_date: DateTime.new(2010,9,1,17),
    status: "completed",
    cust_email: "acb@sample.com",
    cust_address: "123 happy lane, road road, WA 98123",
    credit_card: 1234,
    cc_expire: DateTime.new(2019, 6, 22)
  }
  ])


  # Order_products.create ([
  #   {
  #     product_id: Product.first,
  #     order_id: Order.first,
  #     quantity: 3
  #   },
  #   {
  #     product_id: Product.last,
  #     order_id: Order.first,
  #     quantity: 2
  #   },
  #   {
  #     product_id: Product.find(3),
  #     order_id: Order.first,
  #     quantity: 1
  #   }
  #
  #   ])




vendors = Vendor.create ([
  { username: "Polar Queen", email: "queen@seriouslyfreezing.com", uid: "444", provider: "github" },
  { username: "Ranger Rick", email: "rr@raccoonspace.net", uid: "333", provider: "github"},
  { username: "Dwight Schrute", email: "schrutefarms@gmail.com", uid: "331", provider: "github"},
  { username: "Jim Halpert", email: "jim@athlead.com", uid: "3312", provider: "github"},
  { username: "Pam Beasley", email: "Pam@prattinstitute.com", uid: "334", provider: "github"},
  { username: "Michael Scott", email: "mscott@greatscottproductions.com", uid: "335", provider: "github"},
  { username: "Kelly Kapoor", email: "kkapoor@businessbitch.com", uid: "336", provider: "github"},
  { username: "Ryan Howard", email: "rhoward@gwhuf.edu", uid: "337", provider: "github"},
  { username: "Andy Bernard", email: "narddog@cornell.edu", uid: "338", provider: "github"},
  { username: "Kevin Malone", email: "bigbog69@fanduel.com", uid: "339", provider: "github"},
  { username: "Angela Martin", email: "msmartin@lipton4PA.com", uid: "3310", provider: "github"},
  { username: "Toby Flenderson", email: "chadflenderson@flendersonfiles.com", uid: "3311", provider: "github"},
  { username: "Creed Bratton", email: "notcreedbratton@creedthoughts.gov", uid: "3313", provider: "github"},
  { username: "David Wallace", email: "dwallace@suckit.com", uid: "3314", provider: "github"}
  ])

  Product.create ([
    {
      name: "Dinner on an Ice Floe with a Polar Bear",
      vendor: vendors.first,
      price: 1800,
      inventory: 4,
      description: "This voluptuous feast of sea lion flipper with braised lichen will be served with extraordinary company in a sublime setting.",
      photo_url: "https://unsplash.it/800/800/image=1045",
      lifecycle: "available"
    },
    {
      name: "Hot Air Balloon Ride with Opera Singers",
      vendor: vendors.last,
      price: 550,
      inventory: 2,
      description: "Enjoy the sonic assault of high flight in close quarters with some of humankind's most emphatic voices; rose in a can and light cocktail snacks provided.",
      photo_url: "https://unsplash.it/800/800/image=1046",
      lifecycle: "available"
    },
    {
      name: "Ferry Ride Guided by Enthusiastic Kindergartner",
      vendor: vendors.first,
      price: 150,
      inventory: 15,
      description: "Puget Sound transformed through the eyes of a short but passionate local.",
      photo_url: "https://unsplash.it/800/800/image=1047",
      lifecycle: "available"
    },
    {
      name: "17-course Hyperlocal Vegan Meal for Two",
      vendor: vendors.last,
      price: 250,
      inventory: 6,
      description: "An extravagant yet ethical feast featuring only ingredients sourced from our 25' x 25' back yard.",
      photo_url: "https://unsplash.it/800/800/image=1048",
      lifecycle: "available"
    },
    {
      name: "Work on a Classic Mustang with My Dad",
      vendor: vendors.last,
      price: 450,
      inventory: 25,
      description: "A full-day excursion to my dad's poorly ventilated garage workshop, where you'll hold wrenches, fetch solvent, and listen to baseball on the radio while deepening your knowledge of the 1965 V8 Convertible.",
      photo_url: "https://unsplash.it/800/800/image=1049",
      lifecycle: "available"
    },
    {
      name: "Another Thing",
      vendor: vendors.last,
      price: 450,
      inventory: 25,
      description: "A full-day excursion to my dad's poorly ventilated garage workshop, where you'll hold wrenches, fetch solvent, and listen to baseball on the radio while deepening your knowledge of the 1965 V8 Convertible.",
      photo_url: "https://unsplash.it/800/800/image=1050",
      lifecycle: "available"
    }
    ])


     Category.create ([
      { name: 'Spa' },
      { name: 'Romantic Dinner' },
      { name: 'Rock Climbing' },
      { name: 'Dinner Cruise' },
      { name: 'Shopping Excursion' },
      { name: 'Night at the Museum' },
      { name: 'Cupcake Night' }
      ])

      Product.all.each do |product|
        (rand(3) + 1).times do
          product.categories << Category.all.sample
        end
      end



    reviews =  [
      { rating: 1,
        product: Product.all.sample,
        comment: "A great experience"
      },
      {
        product: Product.all.sample,
        rating: 4,
        comment: "Highly recommend"
      },
      {
        product: Product.all.sample,
        rating: 5,
        comment: "A new favorite"
      },
      {
        product: Product.all.sample,
        rating: 3,
        comment: "Wow. Will cherish forever"
      },
      {
        product: Product.all.sample,
        rating: 2,
        comment: "Unforgettable experience"
      },
      {
        product: Product.all.sample,
        rating: 5,
        comment: "So indulgent"
      },
      {
        product: Product.all.sample,
        rating: 4,
        comment: "Can I go back now"
      },
      {
        product: Product.all.sample,
        rating: 2,
        comment: "Meh"
      }
    ]


    success_count = 0
    reviews.each do |review|
      new_review = Review.create(review)

      if new_review.id
        success_count += 1
        puts "#{new_review.comment} successfully added"
      end
    end

    puts "#{success_count} out of #{reviews.length} successfully added"
