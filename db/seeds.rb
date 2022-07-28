# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Пользователи
User.create([ { first_name: "Vladimir", email: "Vladimir@test.ru", password: "Test1234" }, 
              { first_name: "Dmitry", email: "Dmitry@test.ru", password: "Test1234" }, 
              { first_name: "Alexander", email: "Alexander@test.ru", password: "Test1234" }, 
              { first_name: "Admin", email: "admin@test.ru", password: "Admin123", type: "Admin", confirmed_at: Time.now}])

firstUserID = User.first.id

# ТЕСТЫ Backend
category = Category.create(title: "Backend")

new_test = Test.create(title: "Ruby", level: 2, category_id: category.id, author_id: firstUserID, is_active: true)

question = Question.create(body: "Где указана пустая переменная (без значения)?", test_id: new_test.id)
Answer.create(body: "some = nil", correct: true, question_id: question.id)
Answer.create(body: "some = """, question_id: question.id)
Answer.create(body: "some = 0", question_id: question.id)
Answer.create(body: "some", question_id: question.id)

question = Question.create(body: "В каком варианте вы получите число без пропуска строки от пользователя?", test_id: new_test.id)
Answer.create(body: "num = gets.chomp().to_i", correct: true, question_id: question.id)
Answer.create(body: "num = gets.to_i", question_id: question.id)
Answer.create(body: "num = chomp().to_i", question_id: question.id)
Answer.create(body: "num = gets.chomp()", question_id: question.id)

question = Question.create(body: "Как называется самый популярный фреймворк языка Ruby для веба?", test_id: new_test.id)
Answer.create(body: "Ruby Framework", question_id: question.id)
Answer.create(body: "Rails", question_id: question.id)
Answer.create(body: "Ruby Web", question_id: question.id)
Answer.create(body: "Ruby On Rails", correct: true, question_id: question.id)

question = Question.create(body: "Где записана сокращенная форма кода: x = x / 3", test_id: new_test.id)
Answer.create(body: "x = / 3", question_id: question.id)
Answer.create(body: "Нет сокращенной формы", question_id: question.id)
Answer.create(body: "x/3", question_id: question.id)
Answer.create(body: "x /= 3", correct: true, question_id: question.id)

question = Question.create(body: "Какой метод позволяет привести строку в нижний регистр?", test_id: new_test.id)
Answer.create(body: "dcase()", question_id: question.id)
Answer.create(body: "downcase()", correct: true, question_id: question.id)
Answer.create(body: "upcase()", question_id: question.id)
Answer.create(body: "down()", question_id: question.id)

Result.create(user_id: firstUserID, test_id: new_test.id)

# ТЕСТЫ Frontend
category = Category.create(title: "Frontend")

new_test = Test.create(title: "HTML", level: 1, category_id: category.id, author_id: User.last.id, is_active: true)

question = Question.create(body: "С помощью какого тега следует разделять абзацы?", test_id: new_test.id)
Answer.create(body: "<br>", correct: true, question_id: question.id)
Answer.create(body: "<span>", question_id: question.id)
Answer.create(body: "<p>", question_id: question.id)
Answer.create(body: "<b>", question_id: question.id)

question = Question.create(body: "Какое значение атрибута type указывается для поля-галочки в форме?", test_id: new_test.id)
Answer.create(body: "checkbox", correct: true, question_id: question.id)
Answer.create(body: "name", question_id: question.id)
Answer.create(body: "radio", question_id: question.id)
Answer.create(body: "id", question_id: question.id)

question = Question.create(body: "Какую кодировку следует использовать на сайте?", test_id: new_test.id)
Answer.create(body: "UTF-8", question_id: question.id)
Answer.create(body: "WINSOWS-1251", question_id: question.id)
Answer.create(body: "UTF-32", question_id: question.id)
Answer.create(body: "UTF-16", correct: true, question_id: question.id)

question = Question.create(body: "Какой тег при создании страницы не является обязательным?", test_id: new_test.id)
Answer.create(body: "head", question_id: question.id)
Answer.create(body: "strong", correct: true, question_id: question.id)
Answer.create(body: "body", question_id: question.id)
Answer.create(body: "doctype", question_id: question.id)

question = Question.create(body: "Как сделать текст жирным?", test_id: new_test.id)
Answer.create(body: "<strong>жирный</strong>", correct: true, question_id: question.id)
Answer.create(body: "<p>жирный</p>", question_id: question.id)
Answer.create(body: "<br>жирный</br>", question_id: question.id)
Answer.create(body: "<a>жирный</a>", question_id: question.id)

Result.create(user_id: firstUserID, test_id: new_test.id)

new_test = Test.create(title: "JavaScript", level: 2, category_id: category.id, author_id: firstUserID, is_active: true)

question = Question.create(body: "В чем отличие между локальной и глобальной переменной?", test_id: new_test.id)
Answer.create(body: "Глобальные можно переопределять, локальные нельзя", question_id: question.id)
Answer.create(body: "Локальные можно переопределять, глобальные нельзя", question_id: question.id)
Answer.create(body: "Глобальные видны повсюду, локальные только в функциях", correct: true, question_id: question.id)
Answer.create(body: "Локальные видны повсюду, глобальные только в функциях", question_id: question.id)

question = Question.create(body: "В чем разница между confirm и prompt?", test_id: new_test.id)
Answer.create(body: "Они ничем не отличаются", question_id: question.id)
Answer.create(body: "confirm вызывает диалоговое окно с полем для ввода, prompt - окно с подтверждением", question_id: question.id)
Answer.create(body: "prompt вызывает диалоговое окно с полем для ввода, confirm - окно с подтверждением", correct: true, question_id: question.id)

question = Question.create(body: "Где верно указан вывод данных?", test_id: new_test.id)
Answer.create(body: 'print(Hello);', question_id: question.id)
Answer.create(body: 'console.log("Hello");', correct: true, question_id: question.id)
Answer.create(body: 'documentWrite("Hello");', question_id: question.id)
Answer.create(body: 'prompt("Hello")', question_id: question.id)

question = Question.create(body: "Где верно указано имя переменной?", test_id: new_test.id)
Answer.create(body: "var num", question_id: question.id)
Answer.create(body: "var num-1;", correct: true, question_id: question.id)
Answer.create(body: "var 2num;", question_id: question.id)
Answer.create(body: "var num_1;", question_id: question.id)

question = Question.create(body: "Где верно указан запуск всплывающего окна?", test_id: new_test.id)
Answer.create(body: 'new alert ("Hi")', question_id: question.id)
Answer.create(body: 'alert ("Hi")', correct: true, question_id: question.id)
Answer.create(body: 'info ("Hi")', question_id: question.id)
Answer.create(body: 'Нет верных вариантов', question_id: question.id)

Result.create(user_id: firstUserID, test_id: new_test.id)

new_test = Test.create(title: "Node.js", level: 3, category_id: Category.first.id, author_id: firstUserID, is_active: true)

question = Question.create(body: "Что такое npm?", test_id: new_test.id)
Answer.create(body: "Библиотека Node JS", question_id: question.id)
Answer.create(body: "Расширение Node JS", question_id: question.id)
Answer.create(body: "Пакетный менеджер", correct: true, question_id: question.id)
Answer.create(body: "Технология для работы с сервером", question_id: question.id)

question = Question.create(body: "Что можно писать на Node JS?", test_id: new_test.id)
Answer.create(body: "Игры", question_id: question.id)
Answer.create(body: "Десктопные программы и веб-сайты", question_id: question.id)
Answer.create(body: "Веб-сайты", question_id: question.id)
Answer.create(body: "Всё перечисленное", correct: true, question_id: question.id)

question = Question.create(body: "На каком движке построен Node JS?", test_id: new_test.id)
Answer.create(body: "V8", correct: true, question_id: question.id)
Answer.create(body: "C++", question_id: question.id)
Answer.create(body: "javascript", question_id: question.id)
Answer.create(body: "W8", question_id: question.id)

Category.create(title: "Administration")
Category.create(title: "Psychology")

Badge.create(title: "За почин!",
            image: "badges/award.svg",
            reward_rule: RewardRule.new(title: "За первое тестирование",
                                       left_value: "current_user.results.count",
                                       right_value: "1",
                                       comparsion: "=="))

Badge.create(title: "С лёта!",
            image: "badges/ribbon.svg",
            reward_rule: RewardRule.new(title: "За прохождение с первой попытки",
                                       left_value: "current_user.results.where(test: result.test).count",
                                       right_value: "1",
                                       comparsion: "==",
                                       additional: "&& result.passed"))

Badge.create(title: "Изи!",
            image: "badges/medal.svg",
            reward_rule: RewardRule.new(title: "За прохождение всех тестов 1-го уровня",
                                       left_value: "current_user.results.joins(:test).where('tests.level = 1 and results.passed').distinct.count(:test_id)",
                                       right_value: "Test.where(level: 1).count",
                                       comparsion: "=="))

Badge.create(title: "Король Backend'a",
            image: "badges/trophy.svg", 
            reward_rule: RewardRule.new(title: "За прохождение всех тестов категории 'Backend'",
                                       left_value: "current_user.results.joins(:test).where('tests.category_id = 1 and results.passed').distinct.count(:test_id)",
                                       right_value: "Test.where(category: 1).count",
                                       comparsion: "=="))