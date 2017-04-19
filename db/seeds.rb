# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
vendors = [
  { username: "Dwight Schrute", email: "schrutefarms@gmail.com"},
  { username: "Jim Halpert", email: "jim@athlead.com"},
  { username: "Pam Beasley", email: "Pam@prattinstitute.com"},
  { username: "Michael Scott", email: "mscott@greatscottproductions.com"},
  { username: "Kelly Kapoor", email: "kkapoor@businessbitch.com"},
  { username: "Ryan Howard", email: "rhoward@gwhuf.edu"},
  { username: "Andy Bernard", email: "narddog@cornell.edu"},
  { username: "Kevin Malone", email: "bigbog69@fanduel.com"},
  { username: "Angela Martin", email: "msmartin@lipton4PA.com"},
  { username: "Toby Flenderson", email: "chadflenderson@flendersonfiles.com"},
  { username: "Creed Bratton", email: "notcreedbratton@creedthoughts.gov"},
  { username: "David Wallace", email: "dwallace@suckit.com"}
  ]

vendors.each do | vendor |
  vendor = Vendor.new
end
