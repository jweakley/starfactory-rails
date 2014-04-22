FactoryGirl.create(:admin_user,
  name: 'Doug Waltman', email: 'doug@dougwaltman.com')

(1..2).each { |n| FactoryGirl.create(:instructor_user,
  name: "Instructor #{n}", email: "instructor#{n}@starfactory.co") }

(1..5).each { |n| FactoryGirl.create(:student_user,
  name: "Student #{n}", email: "student#{n}@starfactory.co") }
