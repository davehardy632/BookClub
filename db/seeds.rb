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


Review.create(title: 'House of Leaves Review', description: 'It was good.', rating: 3, book: Book.find_by(title: 'House of Leaves'), user: 'Bill')
Review.create(title: 'House of Leaves Review 2', description: 'It was great.', rating: 5, book: Book.find_by(title: 'House of Leaves'), user: 'Bill')
Review.create(title: 'Good Omens Review', description: 'It was amazing.', rating: 5, book: Book.find_by(title: 'Good Omens'), user: 'Sandy')
Review.create(title: 'Review of Good Omens', description: 'It was not amazing.', rating: 1, book: Book.find_by(title: 'Good Omens'), user: 'Todd')
Review.create(title: 'P&P', description: 'It was amazing.', rating: 4, book: Book.find_by(title: 'Pride and Prejudice'), user: 'Kat')
Review.create(title: 'P&P', description: 'It was not amazing.', rating: 1, book: Book.find_by(title: 'Pride and Prejudice'), user: 'John')
Review.create(title: 'Janes Emma', description: 'my fav.', rating: 5, book: Book.find_by(title: 'Emma'), user: 'Kat')
Review.create(title: 'review of private LA', description: 'i enjoyed this book', rating: 3, book: Book.find_by(title: 'Private LA'), user: 'Jo')
Review.create(title: 'review-private LA', description: 'i did not enjoyed this book', rating: 1, book: Book.find_by(title: 'Private LA'), user: 'Jill')
Review.create(title: 'review of Gone', description: 'not enough action', rating: 1, book: Book.find_by(title: 'Gone'), user: 'John')
Review.create(title: 'review of Gilded Age', description: 'interesting parallels to today society', rating: 1, book: Book.find_by(title: 'The Gilded Age'), user: 'John')
Review.create(title: 'review of Gilded Age', description: 'good, long read, great for a snowy day', rating: 4, book: Book.find_by(title: 'The Gilded Age'), user: 'Todd')
Review.create(title: 'review of Emma', description: 'good, long read', rating: 3, book: Book.find_by(title: 'Emma'), user: 'Teresa')
Review.create(title: 'review of Tom Sawyer', description: 'good to the last page', rating: 4, book: Book.find_by(title: 'Adventures of Tom Sawyer'), user: 'Bill')
Review.create(title: 'review Huckleberry Finn', description: 'my favorite book, you should read it too', rating: 3, book: Book.find_by(title: 'Adventures of Huckleberry Finn'), user: 'Jo')
Review.create(title: 'review Invisible', description: 'my favorite book', rating: 2, book: Book.find_by(title: 'Invisible'), user: 'Sandy')
Review.create(title: 'review of Gone', description: 'terrible', rating: 1, book: Book.find_by(title: 'Gone'), user: 'Kat')
Review.create(title: 'review of Sense and Sensibility', description: 'Sensible', rating: 2, book: Book.find_by(title: 'Sense and Sensibility'), user: 'Jo')
Review.create(title: 'review of The Fifty Year Sword', description: 'very interesting, good plot', rating: 5, book: Book.find_by(title: 'The Fifty Year Sword'), user: 'Gonzo')
Review.create(title: 'Harry Potter and the Sorcerer\'s Stone', description: 'good fun, good plot', rating: 4, book: Book.find_by(title: 'Harry Potter and the Sorcerer\'s Stone'), user: 'Jill')
Review.create(title: 'review Huckleberry Finn', description: 'my favorite book, you should read it too', rating: 3, book: Book.find_by(title: 'Adventures of Huckleberry Finn'), user: 'John')
Review.create(title: 'review Invisible', description: 'favorite book', rating: 2, book: Book.find_by(title: 'Invisible'), user: 'Jill')
Review.create(title: 'review of Gone', description: 'terrible', rating: 1, book: Book.find_by(title: 'Gone'), user: 'Jo')
Review.create(title: 'review of Sense and Sensibility', description: 'Sensible', rating: 2, book: Book.find_by(title: 'Sense and Sensibility'), user: 'Todd')
Review.create(title: 'review of The Fifty Year Sword', description: 'very interesting, good plot', rating: 5, book: Book.find_by(title: 'The Fifty Year Sword'), user: 'Bill')
Review.create(title: 'review Huckleberry Finn', description: 'favorite read, you should read it too', rating: 3, book: Book.find_by(title: 'Adventures of Huckleberry Finn'), user: 'Gonzo')
Review.create(title: 'review Invisible', description: 'favorite coaster', rating: 1, book: Book.find_by(title: 'Invisible'), user: 'Sandy')
Review.create(title: 'review of Gone', description: 'terrible', rating: 1, book: Book.find_by(title: 'Gone'), user: 'Jill')
Review.create(title: 'review of Sense and Sensibility', description: 'Sensible', rating: 2, book: Book.find_by(title: 'Sense and Sensibility'), user: 'Bill')
Review.create(title: 'review of The Fifty Year Sword', description: 'very interesting, good plot', rating: 5, book: Book.find_by(title: 'The Fifty Year Sword'), user: 'Kat')
