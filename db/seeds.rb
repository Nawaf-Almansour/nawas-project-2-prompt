# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
# User.create!(name:  'admin',
#              email: 'admin1@nawas.org',
#              password:              '449988',
#              password_confirmation: '449988',
#              admin:     true)

             User.create!(name:  'admin',
                          email: 'admin2@nawas.org',
                          password:              '449988',
                          password_confirmation: '449988',
                          admin:     true)

book = Book.create( title:'Python Crash Course', category:'programming' ,book_year_published:'2018-06-23' ,image:'p1.jpg', description: 'by Eric Matthes (Author)' , price: 27.33)
book = Book.create( title:'C# Programming', category:'programming' ,book_year_published:'2019-03-23' ,image:'c2.jpg', description: 'by William Sullivan (Author)' , price: 16.37)
book = Book.create( title:'Computer Programming', category:'programming' ,book_year_published:'2018-03-23' ,image:'c3.jpg', description: 'by Cooper Alvin  (Author)' , price: 42.38)
book = Book.create( title:'Programming Rust', category:'programming' ,book_year_published:'2017-03-23' ,image:'p4.jpg', description: 'Jason Orendorff (Author)' , price: 40.00)
book = Book.create( title:'Python 3 Object-Oriented', category:'programming' ,book_year_published:'2018-03-23' ,image:'p5.jpg', description: 'Dusty Phillips  (Author)' , price: 39.99)
book = Book.create( title:'Dynamic Programming', category:'programming' ,book_year_published:'2017-03-23' ,image:'d6.jpg', description: ' Dimitri Bertsekas (Author)' , price: 44.50)
book = Book.create( title:'Programming iOS 12', category:'programming' ,book_year_published:'2017-03-23' ,image:'p7.jpg', description: ' by Matt Neuburg  (Author)' , price: 50.46)
book = Book.create( title:'PHP: The Complete Guide ', category:'programming' ,book_year_published:'2019-03-23' ,image:'p8.jpg', description: ' by MG Martin  (Author)' , price: 24.99)
book = Book.create( title:'Hands-On Programming with R', category:'programming' ,book_year_published:'2014-03-23' ,image:'h9.jpg', description: 'by Garrett Grolemund  (Author)' , price: 39.99)
book = Book.create( title:'Beginning Programming with C', category:'programming' ,book_year_published:'2014-03-23' ,image:'b10.jpg', description: 'by Dan Gookin  (Author)' , price: 29.99 )
book = Book.create( title:'Swift: The Complete Guide', category:'programming' ,book_year_published:'2019-03-23' ,image:'s11.jpg', description: 'by MG Martin  (Author)' , price: 29.54 )
book = Book.create( title:'Android Programming for Beginners', category:'programming' ,book_year_published:'2018-03-23' ,image:'a12.jpg', description: 'by John Horton (Author)' , price: 44.99 )
book = Book.create( title:'Learn Ruby On Rails', category:'programming' ,book_year_published:'2015-03-23' ,image:'r13.jpg', description: 'by John Elder  (Author)' , price: 22.88 )
