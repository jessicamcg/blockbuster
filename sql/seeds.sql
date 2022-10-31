use blockbuster;
insert into category (category_name) values ('Action'), ('Drama'), ('Comedy'), ('Romance'), ('Science Fiction');
-- select * from category;
insert into product (title, summary, price, stock, image_url, category_id)
values
    ('Space Odyssey','HAL',15.00,10,"https://m.media-amazon.com/images/I/618TzJaOw4L._AC_UF894,1000_QL80_.jpg",5),
	('Titanic','Jack vs Rose',12.00,100,"https://m.media-amazon.com/images/I/513BS19H0pL._AC_UF894,1000_QL80_.jpg",2),
    ('The King\'s Speech','stuttering king gets help',12.00,8,"https://m.media-amazon.com/images/M/MV5BMzU5MjEwMTg2Nl5BMl5BanBnXkFtZTcwNzM3MTYxNA@@._V1_.jpg",2),
    ('Twilight','Edward vs Bella',30.00,5,"https://m.media-amazon.com/images/I/41IHimH52qL._AC_SY780_.jpg",4),
    ('Star Wars Episode III - Revenge of the Sith','anakin',25.00,6,"https://m.media-amazon.com/images/I/61jCCwfO6HL.jpg",1),
    ('The Lego Movie','legos',500.00,2,"https://m.media-amazon.com/images/M/MV5BMTg4MDk1ODExN15BMl5BanBnXkFtZTgwNzIyNjg3MDE@._V1_.jpg",3),
    ('Romeo and Juliet','yea',20000.00,1,"https://ih1.redbubble.net/image.3197480925.6955/flat,750x,075,f-pad,750x1000,f8f8f8.jpg",3);
-- select * from product;
insert into admin (first_name, last_name, email, password)
values ("Jessica","Guico","jessica@admin.com","jessica");
