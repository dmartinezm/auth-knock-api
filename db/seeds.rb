User.destroy_all

diego = User.create(first_name: 'Diego', last_name: 'Martinez', email: 'diego@mail.com', password: 'hello', password_confirmation: 'hello')
