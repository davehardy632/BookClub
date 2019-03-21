# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
require './app/models/author'
require './app/models/book'
Book.destroy_all
Author.destroy_all

authors = [
  { name: 'Mark Z. Danielewski' },
  { name: 'Terry Pratchett' },
  { name: 'Neil Gaiman' },
  { name: 'J. K. Rowling' },
  { name: 'William Shakespeare' },
  { name: 'Jane Austen' },
  { name: 'Mark Twain' },
  { name: 'James Patterson' },
  { name: 'Candice Fox' },
  { name: 'Maxine Paetro' },
  { name: 'Stephen Baxter' }
]

authors.each do |author|
  Author.create(author)
end

Author.find_by(name: 'Mark Z. Danielewski').books.create(title: 'House of Leaves', pages: 709, year: 2000)
Author.find_by(name: 'Mark Z. Danielewski').books.create(title: 'The Fifty Year Sword', pages: 550, year: 2000)
Book.create(title: 'Good Omens', pages: 288, year: 1990, authors: [Author.find_by(name: 'Terry Pratchett'), Author.find_by(name: 'Neil Gaiman')])
Book.create(title: 'The Long Cosmos', pages: 300, year: 1990, authors: [Author.find_by(name: 'Terry Pratchett'), Author.find_by(name: 'Stephen Baxter')])
Author.find_by(name: 'J. K. Rowling').books.create(title: 'Harry Potter and the Sorcerer\'s Stone', pages: 309, year: 1998)
Author.find_by(name: 'Mark Twain').books.create(title: 'The Adventures of Tom Sawyer', pages: 450, year: 1998)
Author.find_by(name: 'Mark Twain').books.create(title: 'The Adventures of Huckleberry Finn', pages: 400, year: 1998)
Author.find_by(name: 'Mark Twain').books.create(title: 'The Glided Age', pages: 300, year: 1998)
Author.find_by(name: 'James Patterson').books.create(title: 'Invisible', pages: 250, year: 1998)
Author.find_by(name: 'James Patterson').books.create(title: 'Gone', pages: 275, year: 1998)
Author.find_by(name: 'James Patterson').books.create(title: 'Private LA', pages: 225, year: 1998)
Author.find_by(name: 'Jane Austen').books.create(title: 'Sense and Sensibility', pages: 505, year: 1998)
Author.find_by(name: 'Jane Austen').books.create(title: 'Emma', pages: 475, year: 1998)
Author.find_by(name: 'Jane Austen').books.create(title: 'Pride and Prejudice', pages: 425, year: 1998)

User.create(name: 'Bill')
User.create(name: 'Sandy')
User.create(name: 'John')
User.create(name: 'Jo')
User.create(name: 'Kat')
User.create(name: 'Chris')
User.create(name: 'Todd')
User.create(name: 'Jill')
User.create(name: 'Gonzo')

Review.create(review_title: 'House of Leaves Review', text: 'It was good.', rating: 3, book: Book.find_by(title: 'House of Leaves'), user: User.find_by(name: 'Bill'))
Review.create(review_title: 'House of Leaves Review 2', text: 'It was great.', rating: 5, book: Book.find_by(title: 'House of Leaves'), user: User.find_by(name: 'Bill'))
Review.create(review_title: 'Good Omens Review', text: 'It was amazing.', rating: 5, book: Book.find_by(title: 'Good Omens'), user: User.find_by(name: 'Sandy'))
Review.create(review_title: 'Review of Good Omens', text: 'It was not amazing.', rating: 1, book: Book.find_by(title: 'Good Omens'), user: User.find_by(name: 'Todd'))
Review.create(review_title: 'P&P', text: 'It was amazing.', rating: 4, book: Book.find_by(title: 'Pride and Prejudice'), user: User.find_by(name: 'Kat'))
Review.create(review_title: 'P&P', text: 'It was not amazing.', rating: 1, book: Book.find_by(title: 'Pride and Prejudice'), user: User.find_by(name: 'John'))
Review.create(review_title: 'Janes Emma', text: 'my fav.', rating: 5, book: Book.find_by(title: 'Emma'), user: User.find_by(name: 'Kat'))
Review.create(review_title: 'review of private LA', text: 'i enjoyed this book', rating: 3, book: Book.find_by(title: 'Private LA'), user: User.find_by(name: 'Jo'))
Review.create(review_title: 'review-private LA', text: 'i did not enjoyed this book', rating: 1, book: Book.find_by(title: 'Private LA'), user: User.find_by(name: 'Jill'))
Review.create(review_title: 'review of Gone', text: 'not enough action', rating: 1, book: Book.find_by(title: 'Gone'), user: User.find_by(name: 'John'))
Review.create(review_title: 'review of Gilded Age', text: 'interesting parallels to today society', rating: 1, book: Book.find_by(title: 'The Gilded Age'), user: User.find_by(name: 'John'))
Review.create(review_title: 'review of Gilded Age', text: 'good, long read, great for a snowy day', rating: 4, book: Book.find_by(title: 'The Gilded Age'), user: User.find_by(name: 'Todd'))
Review.create(review_title: 'review of Emma', text: 'good, long read', rating: 3, book: Book.find_by(title: 'Emma'), user: User.find_by(name: 'Teresa'))
Review.create(review_title: 'review of Tom Sawyer', text: 'good to the last page', rating: 4, book: Book.find_by(title: 'Adventures of Tom Sawyer'), user: User.find_by(name: 'Bill'))
Review.create(review_title: 'review Huckleberry Finn', text: 'my favorite book, you should read it too', rating: 3, book: Book.find_by(title: 'Adventures of Huckleberry Finn'), user: User.find_by(name: 'Jo'))
Review.create(review_title: 'review Invisible', text: 'my favorite book', rating: 2, book: Book.find_by(title: 'Invisible'), user: User.find_by(name: 'Sandy'))
Review.create(review_title: 'review of Gone', text: 'terrible', rating: 1, book: Book.find_by(title: 'Gone'), user: User.find_by(name: 'Kat'))
Review.create(review_title: 'review of Sense and Sensibility', text: 'Sensible', rating: 2, book: Book.find_by(title: 'Sense and Sensibility'), user: User.find_by(name: 'Jo'))
Review.create(review_title: 'review of The Fifty Year Sword', text: 'very interesting, good plot', rating: 5, book: Book.find_by(title: 'The Fifty Year Sword'), user: User.find_by(name: 'Gonzo'))
Review.create(review_title: 'Harry Potter and the Sorcerer\'s Stone', text: 'good fun, good plot', rating: 4, book: Book.find_by(title: 'Harry Potter and the Sorcerer\'s Stone'), user: User.find_by(name: 'Jill'))
Review.create(review_title: 'review Huckleberry Finn', text: 'my favorite book, you should read it too', rating: 3, book: Book.find_by(title: 'Adventures of Huckleberry Finn'), user: User.find_by(name: 'John'))
Review.create(review_title: 'review Invisible', text: 'favorite book', rating: 2, book: Book.find_by(title: 'Invisible'), user: User.find_by(name: 'Jill'))
Review.create(review_title: 'review of Gone', text: 'terrible', rating: 1, book: Book.find_by(title: 'Gone'), user: User.find_by(name: 'Jo'))
Review.create(review_title: 'review of Sense and Sensibility', text: 'Sensible', rating: 2, book: Book.find_by(title: 'Sense and Sensibility'), user: User.find_by(name: 'Todd'))
Review.create(review_title: 'review of The Fifty Year Sword', text: 'very interesting, good plot', rating: 5, book: Book.find_by(title: 'The Fifty Year Sword'), user: User.find_by(name: 'Bill'))
Review.create(review_title: 'review Huckleberry Finn', text: 'favorite read, you should read it too', rating: 3, book: Book.find_by(title: 'Adventures of Huckleberry Finn'), user: User.find_by(name: 'Gonzo'))
Review.create(review_title: 'review Invisible', text: 'favorite coaster', rating: 1, book: Book.find_by(title: 'Invisible'), user: User.find_by(name: 'Sandy'))
Review.create(review_title: 'review of Gone', text: 'terrible', rating: 1, book: Book.find_by(title: 'Gone'), user: User.find_by(name: 'Jill'))
Review.create(review_title: 'review of Sense and Sensibility', text: 'Sensible', rating: 2, book: Book.find_by(title: 'Sense and Sensibility'), user: User.find_by(name: 'Bill'))
Review.create(review_title: 'review of The Fifty Year Sword', text: 'very interesting, good plot', rating: 5, book: Book.find_by(title: 'The Fifty Year Sword'), user: User.find_by(name: 'Kat'))
