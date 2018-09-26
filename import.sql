

DROP TABLE IF EXISTS users CASCADE; 
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username VARCHAR(50),
  firstname VARCHAR(50),
  lastname VARCHAR(50),
  password VARCHAR(50),
  birthday CHAR(10),
  email VARCHAR(50)
);
DROP TABLE IF EXISTS intros CASCADE; 
CREATE TABLE intros (
    id SERIAL PRIMARY KEY,
    title VARCHAR(50),
    content VARCHAR(200),
    user_id INTEGER,
    FOREIGN KEY (user_id) REFERENCES users(id)
);


