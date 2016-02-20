Admin.create!([
  {name: "root", email: "root@ncsu.edu", password_digest: "rubyonrailsrocks"},
  {name: "Akshay Nayak", email: "anayakv@ncsu.edu", password_digest: "$2a$10$eai01K/KfFtnPyWe6IQRJOyCchTZfw0Gn0HPdGT5WdybeNECaBk6a"},
  {name: "hayley", email: "h@gmail.com", password_digest: nil},
  {name: "Tony Stark!!!", email: "tony@avengers.com", password_digest: "$2a$10$bgB3PxvZ5hJh73UZPceLeuHDpFoeR.NnAr2KVkMH4Zo/fRec7gtj2"},
  {name: "manisha", email: "mr@ncsu.edu", password_digest: "$2a$10$gPRwWuygxqLI8K42vFRgveO5wP.KMSQbIuBsajSIkbzakUGG7yHci"}
])
Course.create!([
  {course_number: "csc 591-003", title: "ADBI", description: "algorithms for bi", start_date: "2016-01-12", end_date: "2016-05-17", is_active: true, notifications: "enrollment date closed", deadlines: "project 4 due on 24"},
  {course_number: "csc 517", title: "ood", description: "oodd", start_date: "2016-01-17", end_date: "2016-04-17", is_active: true, notifications: "rails project due", deadlines: ""},
  {course_number: "csc 505", title: "algorithms", description: "sorting searching", start_date: "2016-01-16", end_date: "2016-04-17", is_active: false, notifications: "will be offered in fall 2016 again", deadlines: "homework one due"},
  {course_number: "csc 501", title: "Operating Systems", description: "OS", start_date: "2016-01-12", end_date: "2016-06-17", is_active: true, notifications: "threading library due", deadlines: ""},
  {course_number: "csc 522", title: "alda", description: "data mining", start_date: "2016-01-11", end_date: "2016-06-19", is_active: true, notifications: "project proposal due", deadlines: ""},
  {course_number: "csc 520", title: "ai", description: "artificial intelligence", start_date: "2016-01-19", end_date: "2016-05-19", is_active: true, notifications: "", deadlines: ""}
])
Instructor.create!([
  {name: "ed gehringer", email: "edg@ncsu.edu", password_digest: nil},
  {name: "stefen heber", email: "sheber@ncsu.edu", password_digest: nil},
  {name: "nagiza samatova", email: "ng@ncsu.edu", password_digest: "$2a$10$r19iNKmtjAMnC3IfyEOFOuP/75qY5WqCcWH/426k4bo0Tlnv.3ePq"}
])
Student.create!([
  {name: "akshay", email: "abc@", password_digest: nil},
  {name: "ben", email: "ben@ncsu.edu", password_digest: "$2a$10$Mg03OZ0Uqh9wJKprFuysoOTg2NRdNuXNLqTMhQshZ2PzmEnvsAoiW"}
])
User.create!([
  {name: "root", email: "admin@ncsu.edu", is_admin: true, is_instructor: false, password_digest: "$2a$10$NhbxArRDjYK460Q2ZKRa1OvnKA1HRYVk2RupTt4Ub7jWpk2uSTxje"},
  {name: "manisha", email: "manisha@ncsu.edu", is_admin: true, is_instructor: false, password_digest: "$2a$10$7wsJ1DcwyJAXF8rcC/aZmOuww77EPVCRmRYiCJOX1S4F1j6gxmpRO"},
  {name: "krishna", email: "k@ncsu.edu", is_admin: true, is_instructor: false, password_digest: "$2a$10$C2tiL6AndITld4SJJ0T1cePFBQpwiCpkhWlvPFZ/PQ26IUW2.LmCy"},
  {name: "joshua", email: "josh@ncsu.edu", is_admin: false, is_instructor: false, password_digest: "$2a$10$MJZ.gS.KJpGpuVv7QiF.fusUcIBm/dLsL9jxD0TudNpdVX7GaaS2i"},
  {name: "Akshay Nayak", email: "anayakv@ncsu.edu", is_admin: true, is_instructor: false, password_digest: "$2a$10$ih1zMY0JiAZ4dFM.ol6lxuCANbxLgMyFs2gjCU57Tl/w8PsJy.tEa"},
  {name: "jim", email: "jim@ncsu.edu", is_admin: true, is_instructor: false, password_digest: "$2a$10$XjvOw8rwGDAOiWwLIEdblOIScIW4jdpiJHEPLQpwQ2Vz2dfArouHG"},
  {name: "ed gehringer", email: "edg@ncsu.edu", is_admin: false, is_instructor: true, password_digest: "$2a$10$HgY8DWqfOaZCEqBL.Cxz7OHhmVb9HQaXTVdqx6pavONRcz7qwI1cu"},
  {name: "stefen heber", email: "sheber@ncsu.edu", is_admin: false, is_instructor: true, password_digest: "$2a$10$62hdhxqUtbVSkkZi28s2Xu6ohw9wWHPGrQx.1xlWydut0VMX5itmu"},
  {name: "stallman", email: "stallman@ncsu.edu", is_admin: false, is_instructor: true, password_digest: "$2a$10$xC3JpHUYxpOZsg5top9TKeuzQyUx/fFHYC0ge1m8MXKaqWLGJeZ9m"},
  {name: "ashley", email: "ash@ncsu.edu", is_admin: false, is_instructor: false, password_digest: "$2a$10$UfvnpTblf4745Wwr7Rz1c.hN7naahytx5tylEOw.I4zlHdqClKTo2"},
  {name: "nagiza", email: "nagiza@ncsu.edu", is_admin: false, is_instructor: true, password_digest: "$2a$10$aIwC/HAf6B5jRX60joWPheZwmD9f0mKq4tp8opaQi42BYUNi7JGlW"},
  {name: "min chi", email: "chi@ncsu.edu", is_admin: false, is_instructor: true, password_digest: "$2a$10$Dvxk9DwNKVn1fc0QahCrY.JpLUD.3sMUcQjaXrq0fslDVOlQhKtTe"},
  {name: "bahler", email: "bahler@ncsu.edu", is_admin: false, is_instructor: true, password_digest: "$2a$10$2c6lFwfX.NA/ujfAlQFizeIut2DCg0TIyRlTHGV3Wc3k1XBH9f5gW"}
])
UserCourse.create!([
  {is_teaching: true, is_enrolled: false, has_requested_enrollment: false, grade: "", user_id: 8, course_id: 3},
  {is_teaching: true, is_enrolled: false, has_requested_enrollment: false, grade: "", user_id: 9, course_id: 3},
  {is_teaching: true, is_enrolled: false, has_requested_enrollment: false, grade: "", user_id: 7, course_id: 2},
  {is_teaching: true, is_enrolled: false, has_requested_enrollment: false, grade: "", user_id: 13, course_id: 1},
  {is_teaching: true, is_enrolled: false, has_requested_enrollment: false, grade: "", user_id: 14, course_id: 6},
  {is_teaching: true, is_enrolled: false, has_requested_enrollment: false, grade: "", user_id: 15, course_id: 7},
  {is_teaching: false, is_enrolled: true, has_requested_enrollment: false, grade: "", user_id: 11, course_id: 1},
  {is_teaching: false, is_enrolled: false, has_requested_enrollment: true, grade: "", user_id: 11, course_id: 2},
  {is_teaching: false, is_enrolled: true, has_requested_enrollment: true, grade: "A", user_id: 4, course_id: 3},
  {is_teaching: nil, is_enrolled: nil, has_requested_enrollment: true, grade: nil, user_id: 11, course_id: 7},
  {is_teaching: nil, is_enrolled: nil, has_requested_enrollment: true, grade: nil, user_id: 11, course_id: 4},
  {is_teaching: false, is_enrolled: true, has_requested_enrollment: true, grade: "", user_id: 11, course_id: 3}
])
