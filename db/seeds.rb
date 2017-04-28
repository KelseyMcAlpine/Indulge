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
  {
    username: "Polar Queen",
    email: "queen@seriouslyfreezing.com",
    uid: 444,
    provider: "github",
    image_url: "https://unsplash.it/1500/500?image=1060"
  },
  {
    username: "Ranger Rick",
    email: "rr@raccoonspace.net",
    uid: 333,
    provider: "github",
    image_url: "https://unsplash.it/1500/500?image=1061"
  },
  { username: "Dwight Schrute",
    email: "schrutefarms@gmail.com",
    uid: 331,
    provider: "github",
    image_url: "https://unsplash.it/1500/500?image=1062"
  },
  {
    username: "Jim Halpert",
    email: "jim@athlead.com",
    uid: 3312,
    provider: "github",
    image_url: "https://unsplash.it/1500/500?image=1063"
  },
  {
    username: "Pam Beasley",
    email: "Pam@prattinstitute.com",
    uid: 334,
    provider: "github",
    image_url: "https://unsplash.it/1500/500?image=1064"
  },
  {
    username: "Michael Scott",
    email: "mscott@greatscottproductions.com",
    uid: 335,
    provider: "github",
    image_url: "https://unsplash.it/1500/500?image=1065"
  },
  {
    username: "Kelly Kapoor",
    email: "kkapoor@businessbitch.com",
    uid: 336,
    provider: "github",
    image_url: "https://unsplash.it/1500/500?image=1066"
  },
  {
    username: "Ryan Howard",
    email: "rhoward@whuf.edu",
    uid: 337,
    provider: "github",
    image_url: "https://unsplash.it/1500/500?image=1067"
  },
  {
    username: "Andy Bernard",
    email: "narddog@cornell.edu",
    uid: 338,
    provider: "github",
    image_url: "https://unsplash.it/1500/500?image=1068"
  },
  {
    username: "Kevin Malone",
    email: "bigbog69@fanduel.com",
    uid: 339,
    provider: "github",
    image_url: "https://unsplash.it/1500/500?image=1069"
  },
  {
    username: "Angela Martin",
    email: "msmartin@lipton4PA.com",
    uid: 3310,
    provider: "github",
    image_url: "https://unsplash.it/1500/500?image=1070"
  },
  {
    username: "Toby Flenderson",
    email: "chadflenderson@flendersonfiles.com",
    uid: 3311,
    provider: "github",
    image_url: "https://unsplash.it/1500/500?image=1071"
  },
  {
    username: "Creed Bratton",
    email: "notcreedbratton@creedthoughts.gov",
    uid: 3313,
    provider: "github",
    image_url: "https://unsplash.it/1500/500?image=1072"
  },
  {
    username: "David Wallace",
    email: "dwallace@suckit.com",
    uid: 3314,
    provider: "github",
    image_url: "https://unsplash.it/1500/500?image=1073"
  }
  ])

  Product.create ([
    {
      name: "Dinner on an Ice Floe with a Polar Bear",
      vendor: vendors.first,
      price: 1800,
      inventory: 4,
      description: "This voluptuous feast of sea lion flipper with braised lichen will be served with extraordinary company in a sublime setting.",
      photo_url: "https://unsplash.it/800/800?image=1045",
      lifecycle: "available"

    },
    {
      name: "Hot Air Balloon Ride with Opera Singers",
      vendor: vendors.last,
      price: 550,
      inventory: 2,
      description: "Enjoy the sonic assault of high flight in close quarters with some of humankind's most emphatic voices; rose in a can and light cocktail snacks provided.",
      photo_url: "https://unsplash.it/800/800?image=1084",
      lifecycle: "available"
    },
    {
      name: "Ferry Ride Guided by Enthusiastic Kindergartner",
      vendor: vendors.first,
      price: 150,
      inventory: 15,
      description: "Puget Sound transformed through the eyes of a short but passionate local.",
      photo_url: "https://unsplash.it/800/800?image=1080",
      lifecycle: "available"
    },
    {
      name: "17-course Hyperlocal Vegan Meal for Two",
      vendor: vendors.last,
      price: 250,
      inventory: 6,
      description: "An extravagant yet ethical feast featuring only ingredients sourced from our 25' x 25' back yard.",
      photo_url: "https://unsplash.it/800/800?image=1048",
      lifecycle: "available"
    },
    {
      name: "Work on a Classic Mustang with My Dad",
      vendor: vendors.last,
      price: 450,
      inventory: 25,
      description: "A full-day excursion to my dad's poorly ventilated garage workshop, where you'll hold wrenches, fetch solvent, and listen to baseball on the radio while deepening your knowledge of the 1965 V8 Convertible.",
      photo_url: "https://unsplash.it/800/800?image=1049",
      lifecycle: "available"
    },
    {
      name: "Composting With My PNW Neighbor",
      vendor: vendors.last,
      price: 10,
      inventory: 25,
      description: "Full day of filling and aerating my neighbor's composting pile with the sole purpose of nudging it closer and closer to my property. ",
      photo_url: "https://unsplash.it/800/800?image=1051",
      lifecycle: "available"
    }
    ])


     Category.create ([
      { name: 'Spa', image_url: "https://unsplash.it/1500/500?image=1020" },
      { name: 'Romantic Dinner', image_url: "https://unsplash.it/1500/500?image=1021" },
      { name: 'Rock Climbing', image_url: "https://unsplash.it/1500/500?image=1022" },
      { name: 'Dinner Cruise', image_url: "https://unsplash.it/1500/500?image=1023" },
      { name: 'Shopping Excursion', image_url: "https://unsplash.it/1500/500?image=1024" },
      { name: 'Night at the Museum', image_url: "https://unsplash.it/1500/500?image=1025" },
      { name: 'Cupcake Night', image_url: "https://unsplash.it/1500/500?image=1026" },
      { name: 'Hipster Fantastic', image_url: "https://unsplash.it/1500/500?image=1027" }

      ])

      Product.all.each do |product|
        (rand(3) + 1).times do
          product.categories << Category.all.sample
        end
      end



    reviews =  [
      { rating: 1,
        product: Product.all.sample,
        header: "A great experience",
        comment: "Lorem ipsum dolor sit amet, sea cu erat rebum utinam, mel ei maiorum invenire, quo an sonet comprehensam signiferumque. Accumsan hendrerit an mel. Id illud accusam consequat vim, est in doctus efficiantur. Usu ne populo audiam scribentur. Pro et insolens similique. An eam verterem intellegat."
      },
      {
        product: Product.all.sample,
        rating: 4,
        header: "Highly recommend",
        comment: "Eum persius recteque ex, latine tractatos at has, ei usu populo dissentiunt. Vix eu dico verterem, ne stet accusata duo, eam et novum ponderum. Veritus ponderum signiferumque eos et, eu doctus praesent eos. Cu vim novum laudem mnesarchum. Ex admodum nusquam his, vitae soleat intellegebat no duo, pro bonorum labores invenire."
      },
      {
        product: Product.all.sample,
        rating: 5,
        header: "A new favorite",
        comment: "Eum persius recteque ex, latine tractatos at has, ei usu populo dissentiunt. Vix eu dico verterem, ne stet accusata duo, eam et novum ponderum. Veritus ponderum signiferumque eos et, eu doctus praesent eos. Cu vim novum laudem mnesarchum. Ex admodum nusquam his, vitae soleat intellegebat no duo, pro bonorum labores invenire."
      },
      {
        product: Product.all.sample,
        rating: 3,
        header: "Wow. Will cherish forever",
        comment: "Eum persius recteque ex, latine tractatos at has, ei usu populo dissentiunt. Vix eu dico verterem, ne stet accusata duo, eam et novum ponderum. Veritus ponderum signiferumque eos et, eu doctus praesent eos. Cu vim novum laudem mnesarchum. Ex admodum nusquam his, vitae soleat intellegebat no duo, pro bonorum labores invenire."
      },
      {
        product: Product.all.sample,
        rating: 2,
        header: "Unforgettable experience",
        comment: "Commune intellegat usu ei, nam augue ancillae oportere te. At sed epicuri expetendis, ad usu etiam mazim. Ius utamur tractatos ea, verear ceteros deleniti ut has. An nam option nostrud alienum, ad movet percipitur mea."
      },
      {
        product: Product.all.sample,
        rating: 5,
        header: "So indulgent",
        comment: "Eum persius recteque ex, latine tractatos at has, ei usu populo dissentiunt. Vix eu dico verterem, ne stet accusata duo, eam et novum ponderum. Veritus ponderum signiferumque eos et, eu doctus praesent eos. Cu vim novum laudem mnesarchum. Ex admodum nusquam his, vitae soleat intellegebat no duo, pro bonorum labores invenire."
      },
      {
        product: Product.all.sample,
        rating: 4,
        header: "Can I go back now",
        comment: "Ei aeterno bonorum inciderint eam. Ut est electram accusamus, has cibo audire patrioque an. Lucilius lobortis ei nam, ut tale nonumy concludaturque eum. Nonumes oporteat ius id, est ignota oportere vituperata ad. Eu per prima aeterno urbanitas, et quot facilis usu."
      },
      {
        product: Product.all.sample,
        rating: 2,
        header: "Meh",
        comment: "Duo an quodsi fabulas mediocrem, ea eos graeci alienum, eum everti voluptatibus ne. Case ancillae referrentur ius ei, id accommodare disputationi nam. Veri phaedrum argumentum quo an, mea cibo reque te. Dicant minimum deseruisse vis ea. Et sapientem gubergren pri, ne suas meis assueverit cum, eu tibique liberavisse vel. Eam duis nominavi concludaturque at, ut his aperiam argumentum."
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
